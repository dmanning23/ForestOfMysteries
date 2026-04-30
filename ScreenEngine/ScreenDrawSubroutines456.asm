DrawScreen4 subroutine

    ldy #192
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda FoM_4Bitmap0,Y
    sta PF0
    lda FoM_4Bitmap1,Y
    sta PF1
    lda FoM_4Bitmap2,Y
    sta PF2
    nop
    nop
    nop
    lda FoM_4Bitmap3,Y
    sta PF0
    lda FoM_4Bitmap4,Y
    sta PF1
    lda FoM_4Bitmap5,Y
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

DrawScreen5 subroutine

    ldy #192
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda FoM_5Bitmap0,Y
    sta PF0
    lda FoM_5Bitmap1,Y
    sta PF1
    lda FoM_5Bitmap2,Y
    sta PF2
    nop
    nop
    nop
    lda FoM_5Bitmap3,Y
    sta PF0
    lda FoM_5Bitmap4,Y
    sta PF1
    lda FoM_5Bitmap5,Y
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

DrawScreen6 subroutine
    ldy #192
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda FoM_6Bitmap0,Y
    sta PF0
    lda FoM_6Bitmap1,Y
    sta PF1
    lda FoM_6Bitmap2,Y
    sta PF2
    nop
    nop
    nop
    lda FoM_6Bitmap3,Y
    sta PF0
    lda FoM_6Bitmap4,Y
    sta PF1
    lda FoM_6Bitmap5,Y
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

    include "Assets/Graphics/Backgrounds/FoM_4Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_5Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_6Data.asm"
    include "Assets/Graphics/player.dasm"