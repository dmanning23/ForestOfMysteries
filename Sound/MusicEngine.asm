; ============================================================
; MUSIC ENGINE
; ============================================================
; Required zero-page RAM:
;   MUS_FRAME    - frame countdown (1 byte)
;   MUS_STEP     - step within pattern (1 byte)
;   MUS_PAT_IDX  - arrangement index (1 byte)
;   MUS_PLAYING  - 0=stopped, 1=playing (1 byte)
;   MUS_ARR_OFF  - saved arrangement byte offset (1 byte)
;   MUS_PTR      - temp zero-page pointer (2 bytes)
;   MUS_ARR_PTR  - pointer to current song's arrangement table (2 bytes)
;   MUS_TEMPO    - frames per step for current song (1 byte)
;   MUS_NUM_PATS - number of patterns in current song (1 byte)
; Required RAM addresses: AUDV0, AUDV1, AUDF0, AUDF1, AUDC0, AUDC1
; ============================================================
; SoundEngine coexistence:
;   Requires SFX_LEFT and SFX_RIGHT from SoundEngine.
;   If SFX_LEFT != 0, music skips channel 0 (SFX owns it).
;   If SFX_RIGHT != 0, music skips channel 1 (SFX owns it).
;   Music resumes automatically once the SFX finishes.
; ============================================================
;
; Arrangement entry layout (9 bytes each):
;   +0,+1  .word  voice 0 note codes ptr
;   +2,+3  .word  voice 0 volumes ptr
;   +4,+5  .word  voice 1 note codes ptr
;   +6,+7  .word  voice 1 volumes ptr
;   +8     .byte  pattern length
; ============================================================
; Usage:
;   Each song data file provides a MUSIC_INIT_<SONGNAME> helper
;   that sets MUS_ARR_PTR, MUS_TEMPO, MUS_NUM_PATS then calls
;   MUSIC_INIT. Call MUSIC_UPDATE once per frame (VBLANK).
;   Call MUSIC_STOP to silence and halt playback.
; ============================================================

; Driver code → TIA AUDC lookup table
musCtrlTable:
    .byte 4, 6, 7, 8, 15, 12, 1, 3

; ── MUSIC_INIT ─────────────────────────────────────────────────────────
; Preconditions: MUS_ARR_PTR, MUS_TEMPO, MUS_NUM_PATS already set.
; Resets playback state and starts from the beginning.
MUSIC_INIT:
    lda MUS_TEMPO
    sta MUS_FRAME
    lda #0
    sta MUS_STEP
    sta MUS_PAT_IDX
    lda #1
    sta MUS_PLAYING
    rts

; ── MUSIC_STOP ─────────────────────────────────────────────────────────
MUSIC_STOP:
    lda #0
    sta MUS_PLAYING
    sta AUDV0
    sta AUDV1
    rts

; ── MUSIC_UPDATE ───────────────────────────────────────────────────────
; Call once per frame (during vertical blank recommended)
MUSIC_UPDATE:
    lda MUS_PLAYING
    beq .musExit        ; not playing → return
    dec MUS_FRAME
    beq .musStep
.musExit:
    rts

.musStep:
    lda MUS_TEMPO
    sta MUS_FRAME

    ; Calculate arrangement entry byte offset (9 bytes per entry)
    lda MUS_PAT_IDX
    asl             ; *2
    asl             ; *4
    asl             ; *8
    clc
    adc MUS_PAT_IDX ; +idx = *9
    sta MUS_ARR_OFF

    ; ── Voice 0 note ─────────────────────────────
    lda SFX_LEFT                ; skip channel 0 if SFX owns it
    bne .v1Note

    ; Load v0 notes ptr from arrangement[MUS_ARR_OFF+0, +1]
    lda MUS_ARR_OFF
    tay
    lda (MUS_ARR_PTR),y         ; v0 notes ptr lo
    sta MUS_PTR
    iny
    lda (MUS_ARR_PTR),y         ; v0 notes ptr hi
    sta MUS_PTR+1
    ldy MUS_STEP
    lda (MUS_PTR),y             ; load note code
    beq .v0Silence
    pha                         ; save note code
    lsr
    lsr
    lsr
    lsr
    lsr                         ; driver code (0-7)
    tax
    lda musCtrlTable,x
    sta AUDC0
    pla                         ; restore note code
    and #%00011111
    sta AUDF0

    ; Load v0 vols ptr from arrangement[MUS_ARR_OFF+2, +3]
    lda MUS_ARR_OFF
    clc
    adc #2
    tay
    lda (MUS_ARR_PTR),y         ; v0 vols ptr lo
    sta MUS_PTR
    iny
    lda (MUS_ARR_PTR),y         ; v0 vols ptr hi
    sta MUS_PTR+1
    ldy MUS_STEP
    lda (MUS_PTR),y
    sta AUDV0
    jmp .v1Note

.v0Silence:
    lda #0
    sta AUDV0

    ; ── Voice 1 note ─────────────────────────────
.v1Note:
    lda SFX_RIGHT               ; skip channel 1 if SFX owns it
    bne .advanceStep

    ; Load v1 notes ptr from arrangement[MUS_ARR_OFF+4, +5]
    lda MUS_ARR_OFF
    clc
    adc #4
    tay
    lda (MUS_ARR_PTR),y         ; v1 notes ptr lo
    sta MUS_PTR
    iny
    lda (MUS_ARR_PTR),y         ; v1 notes ptr hi
    sta MUS_PTR+1
    ldy MUS_STEP
    lda (MUS_PTR),y             ; load note code
    beq .v1Silence
    pha                         ; save note code
    lsr
    lsr
    lsr
    lsr
    lsr                         ; driver code (0-7)
    tax
    lda musCtrlTable,x
    sta AUDC1
    pla                         ; restore note code
    and #%00011111
    sta AUDF1

    ; Load v1 vols ptr from arrangement[MUS_ARR_OFF+6, +7]
    lda MUS_ARR_OFF
    clc
    adc #6
    tay
    lda (MUS_ARR_PTR),y         ; v1 vols ptr lo
    sta MUS_PTR
    iny
    lda (MUS_ARR_PTR),y         ; v1 vols ptr hi
    sta MUS_PTR+1
    ldy MUS_STEP
    lda (MUS_PTR),y
    sta AUDV1
    jmp .advanceStep

.v1Silence:
    lda #0
    sta AUDV1

    ; ── Advance step ──────────────────────────────
.advanceStep:
    inc MUS_STEP
    ; Load pattern length from arrangement[MUS_ARR_OFF+8]
    lda MUS_ARR_OFF
    clc
    adc #8
    tay
    lda (MUS_ARR_PTR),y         ; pattern length
    cmp MUS_STEP
    bne .musEnd
    lda #0
    sta MUS_STEP
    inc MUS_PAT_IDX
    lda MUS_PAT_IDX
    cmp MUS_NUM_PATS
    bne .musEnd
    lda #0
    sta MUS_PAT_IDX
.musEnd:
    rts
