

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 35 lines of underscan
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    TIMER_SETUP 35

    lda #192
    sta COLUPF

    TIMER_WAIT

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 192 lines of frame
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LinesOfFrame

    ldy #192
    ldx #192

LVScan
    sta WSYNC
    lda FoM_TitleScreenBitmap0,Y
    sta PF0
    lda FoM_TitleScreenBitmap1,Y
    sta PF1
    lda FoM_TitleScreenBitmap2,Y
    sta PF2
    nop
    nop
    nop
    lda FoM_TitleScreenBitmap3,Y
    sta PF0
    lda FoM_TitleScreenBitmap4,Y
    sta PF1
    lda FoM_TitleScreenBitmap5,Y
    sta PF2

    dex
    txa
    and #$03
    bne notDivisible_by_4
    
    dey

notDivisible_by_4
    cpx #0 ;sets the Z flag based on X
    bne LVScan

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 29 lines of overscan
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

OverScan
    TIMER_SETUP 29
    TIMER_WAIT

    include "Assets/Graphics/FoM_TitleScreenData.asm"
