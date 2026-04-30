DrawScreen10 subroutine

    ldy #192
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda FoM_10Bitmap0,Y
    sta PF0
    lda FoM_10Bitmap1,Y
    sta PF1
    lda FoM_10Bitmap2,Y
    sta PF2
    nop
    nop
    nop
    lda FoM_10Bitmap3,Y
    sta PF0
    lda FoM_10Bitmap4,Y
    sta PF1
    lda FoM_10Bitmap5,Y
    sta PF2

    ; odd lines: draw the player sprite (inlined - no JSR/RTS overhead)
    sty temp
    
    txa                     ; X = current scanline
    sec
    sbc playerYPos          ; local coordinate
    cmp #SPRITE_HEIGHT      ; in sprite?
    bcc .InSprite           ; yes
    lda #0                  ; no, use row 0 (transparent)
.InSprite

    lsr
    tay                     ; sprite row -> Y

    sta WSYNC

    lda (spritePtr),y       ; lookup sprite pattern
    
    sta GRP0                ; write sprite bitmap
    lda (spriteColorPtr),y  ; lookup sprite color
    sta COLUP0              ; write color

    lda #0
    sta PF0
    sta PF1
    sta PF2

    ldy temp               ; restore bitmap row index

    dex
    dex
    txa
    and #$03
    bne .notDivisible_by_4

    dey

.notDivisible_by_4

    cpx #0 ;sets the Z flag based on X
    bne .lvscan

    ldy #0  ; restore Y so ScreenWraparound/CheckInput index player 0 correctly

    BANK_SWITCH 0,DoneGameplayScreenDraw

DrawScreen11 subroutine

    ldy #192
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda FoM_11Bitmap0,Y
    sta PF0
    lda FoM_11Bitmap1,Y
    sta PF1
    lda FoM_11Bitmap2,Y
    sta PF2
    nop
    nop
    nop
    lda FoM_2Bitmap3,Y
    sta PF0
    lda FoM_2Bitmap4,Y
    sta PF1
    lda FoM_2Bitmap5,Y
    sta PF2

    ; odd lines: draw the player sprite (inlined - no JSR/RTS overhead)
    sty temp
    
    txa                     ; X = current scanline
    sec
    sbc playerYPos          ; local coordinate
    cmp #SPRITE_HEIGHT      ; in sprite?
    bcc .InSprite           ; yes
    lda #0                  ; no, use row 0 (transparent)
.InSprite

    lsr
    tay                     ; sprite row -> Y

    sta WSYNC

    lda (spritePtr),y       ; lookup sprite pattern
    
    sta GRP0                ; write sprite bitmap
    lda (spriteColorPtr),y  ; lookup sprite color
    sta COLUP0              ; write color

    lda #0
    sta PF0
    sta PF1
    sta PF2

    ldy temp               ; restore bitmap row index

    dex
    dex
    txa
    and #$03
    bne .notDivisible_by_4

    dey

.notDivisible_by_4

    cpx #0 ;sets the Z flag based on X
    bne .lvscan

    ldy #0  ; restore Y so ScreenWraparound/CheckInput index player 0 correctly

    BANK_SWITCH 0,DoneGameplayScreenDraw

DrawScreen12 subroutine
    ldy #192
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda FoM_12Bitmap0,Y
    sta PF0
    lda FoM_12Bitmap1,Y
    sta PF1
    lda FoM_12Bitmap2,Y
    sta PF2
    nop
    nop
    nop
    lda FoM_12Bitmap3,Y
    sta PF0
    lda FoM_12Bitmap4,Y
    sta PF1
    lda FoM_12Bitmap5,Y
    sta PF2

    ; odd lines: draw the player sprite (inlined - no JSR/RTS overhead)
    sty temp
    
    txa                     ; X = current scanline
    sec
    sbc playerYPos          ; local coordinate
    cmp #SPRITE_HEIGHT      ; in sprite?
    bcc .InSprite           ; yes
    lda #0                  ; no, use row 0 (transparent)
.InSprite

    lsr
    tay                     ; sprite row -> Y

    sta WSYNC

    lda (spritePtr),y       ; lookup sprite pattern
    
    sta GRP0                ; write sprite bitmap
    lda (spriteColorPtr),y  ; lookup sprite color
    sta COLUP0              ; write color

    lda #0
    sta PF0
    sta PF1
    sta PF2

    ldy temp               ; restore bitmap row index

    dex
    dex
    txa
    and #$03
    bne .notDivisible_by_4

    dey

.notDivisible_by_4

    cpx #0 ;sets the Z flag based on X
    bne .lvscan

    ldy #0  ; restore Y so ScreenWraparound/CheckInput index player 0 correctly

    BANK_SWITCH 0,DoneGameplayScreenDraw

    include "Assets/Graphics/Backgrounds/FoM_10Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_11Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_12Data.asm"
    include "Assets/Graphics/player.dasm"