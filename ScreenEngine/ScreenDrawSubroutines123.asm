DrawScreen1 subroutine

    ldy #48
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda (backgroundPtr0),Y
    sta PF0
    lda (backgroundPtr1),Y
    sta PF1
    lda (backgroundPtr2),Y
    sta PF2
    nop
    ;nop
    ;nop
    lda (backgroundPtr3),Y
    sta PF0
    lda (backgroundPtr4),Y
    sta PF1
    lda (backgroundPtr5),Y
    sta PF2

    ; odd lines: draw the player sprite (inlined - no JSR/RTS overhead)
    sty temp
    
    txa                     ; X = current scanline
    sec
    sbc playerYPos1          ; local coordinate
    cmp #SPRITE_HEIGHT      ; in sprite?
    bcc .InSprite           ; yes
    lda #0                  ; no, use row 0 (transparent)
.InSprite

    lsr
    tay                     ; sprite row -> Y

    sta WSYNC

    lda (spritePtr1),y       ; lookup sprite pattern
    sta GRP0                ; write sprite bitmap
    lda (spriteColorPtr1),y  ; lookup sprite color
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

    ldy #0  ; restore Y so ScreenWraparoundAll/CheckInput index player 0 correctly

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
    include "Assets/Graphics/player_sprite.asm"