DrawScreen1 subroutine

    ldy #48
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda FoM_1Bitmap0,Y
    sta PF0
    lda FoM_1Bitmap1,Y
    sta PF1
    lda FoM_1Bitmap2,Y
    sta PF2
    nop
    nop
    nop
    lda FoM_1Bitmap3,Y
    sta PF0
    lda FoM_1Bitmap4,Y
    sta PF1
    lda FoM_1Bitmap5,Y
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

DrawScreen2 subroutine

    ldy #192
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda FoM_2Bitmap0,Y
    sta PF0
    lda FoM_2Bitmap1,Y
    sta PF1
    lda FoM_2Bitmap2,Y
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

DrawScreen3 subroutine
    ldy #192
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda FoM_3Bitmap0,Y
    sta PF0
    lda FoM_3Bitmap1,Y
    sta PF1
    lda FoM_3Bitmap2,Y
    sta PF2
    nop
    nop
    nop
    lda FoM_3Bitmap3,Y
    sta PF0
    lda FoM_3Bitmap4,Y
    sta PF1
    lda FoM_3Bitmap5,Y
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




DrawScreen4 subroutine

    ldy #192
    ldx #192

.lvscan

    ; ; even lines: draw the bitmap background
    ; sta WSYNC
    ; lda FoM_4Bitmap0,Y
    ; sta PF0
    ; lda FoM_4Bitmap1,Y
    ; sta PF1
    ; lda FoM_4Bitmap2,Y
    ; sta PF2
    ; nop
    ; nop
    ; nop
    ; lda FoM_4Bitmap3,Y
    ; sta PF0
    ; lda FoM_4Bitmap4,Y
    ; sta PF1
    ; lda FoM_4Bitmap5,Y
    ; sta PF2

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

    ; ; even lines: draw the bitmap background
    ; sta WSYNC
    ; lda FoM_5Bitmap0,Y
    ; sta PF0
    ; lda FoM_5Bitmap1,Y
    ; sta PF1
    ; lda FoM_5Bitmap2,Y
    ; sta PF2
    ; nop
    ; nop
    ; nop
    ; lda FoM_5Bitmap3,Y
    ; sta PF0
    ; lda FoM_5Bitmap4,Y
    ; sta PF1
    ; lda FoM_5Bitmap5,Y
    ; sta PF2

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

    ; ; even lines: draw the bitmap background
    ; sta WSYNC
    ; lda FoM_6Bitmap0,Y
    ; sta PF0
    ; lda FoM_6Bitmap1,Y
    ; sta PF1
    ; lda FoM_6Bitmap2,Y
    ; sta PF2
    ; nop
    ; nop
    ; nop
    ; lda FoM_6Bitmap3,Y
    ; sta PF0
    ; lda FoM_6Bitmap4,Y
    ; sta PF1
    ; lda FoM_6Bitmap5,Y
    ; sta PF2

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




DrawScreen7 subroutine

    ldy #192
    ldx #192

.lvscan

    ; ; even lines: draw the bitmap background
    ; sta WSYNC
    ; lda FoM_7Bitmap0,Y
    ; sta PF0
    ; lda FoM_7Bitmap1,Y
    ; sta PF1
    ; lda FoM_7Bitmap2,Y
    ; sta PF2
    ; nop
    ; nop
    ; nop
    ; lda FoM_7Bitmap3,Y
    ; sta PF0
    ; lda FoM_7Bitmap4,Y
    ; sta PF1
    ; lda FoM_7Bitmap5,Y
    ; sta PF2

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

DrawScreen8 subroutine

    ldy #192
    ldx #192

.lvscan

    ; ; even lines: draw the bitmap background
    ; sta WSYNC
    ; lda FoM_8Bitmap0,Y
    ; sta PF0
    ; lda FoM_8Bitmap1,Y
    ; sta PF1
    ; lda FoM_8Bitmap2,Y
    ; sta PF2
    ; nop
    ; nop
    ; nop
    ; lda FoM_8Bitmap3,Y
    ; sta PF0
    ; lda FoM_8Bitmap4,Y
    ; sta PF1
    ; lda FoM_8Bitmap5,Y
    ; sta PF2

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

DrawScreen9 subroutine
    ldy #192
    ldx #192

.lvscan

    ; ; even lines: draw the bitmap background
    ; sta WSYNC
    ; lda FoM_9Bitmap0,Y
    ; sta PF0
    ; lda FoM_9Bitmap1,Y
    ; sta PF1
    ; lda FoM_9Bitmap2,Y
    ; sta PF2
    ; nop
    ; nop
    ; nop
    ; lda FoM_9Bitmap3,Y
    ; sta PF0
    ; lda FoM_9Bitmap4,Y
    ; sta PF1
    ; lda FoM_9Bitmap5,Y
    ; sta PF2

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




DrawScreen10 subroutine

    ldy #192
    ldx #192

.lvscan

    ; ; even lines: draw the bitmap background
    ; sta WSYNC
    ; lda FoM_10Bitmap0,Y
    ; sta PF0
    ; lda FoM_10Bitmap1,Y
    ; sta PF1
    ; lda FoM_10Bitmap2,Y
    ; sta PF2
    ; nop
    ; nop
    ; nop
    ; lda FoM_10Bitmap3,Y
    ; sta PF0
    ; lda FoM_10Bitmap4,Y
    ; sta PF1
    ; lda FoM_10Bitmap5,Y
    ; sta PF2

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

    ; ; even lines: draw the bitmap background
    ; sta WSYNC
    ; lda FoM_11Bitmap0,Y
    ; sta PF0
    ; lda FoM_11Bitmap1,Y
    ; sta PF1
    ; lda FoM_11Bitmap2,Y
    ; sta PF2
    ; nop
    ; nop
    ; nop
    ; lda FoM_2Bitmap3,Y
    ; sta PF0
    ; lda FoM_2Bitmap4,Y
    ; sta PF1
    ; lda FoM_2Bitmap5,Y
    ; sta PF2

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

    ; ; even lines: draw the bitmap background
    ; sta WSYNC
    ; lda FoM_12Bitmap0,Y
    ; sta PF0
    ; lda FoM_12Bitmap1,Y
    ; sta PF1
    ; lda FoM_12Bitmap2,Y
    ; sta PF2
    ; nop
    ; nop
    ; nop
    ; lda FoM_12Bitmap3,Y
    ; sta PF0
    ; lda FoM_12Bitmap4,Y
    ; sta PF1
    ; lda FoM_12Bitmap5,Y
    ; sta PF2

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

    include "Assets/Graphics/Backgrounds/FoM_1Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_2Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_3Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_4Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_5Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_6Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_7Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_8Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_9Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_10Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_11Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_12Data.asm"
    include "Assets/Graphics/player.dasm"