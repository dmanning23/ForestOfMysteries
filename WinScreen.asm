WinScreenLogic subroutine

    ;update the frame counter
    inc frameCounter

    ;Update the sound engine
    BANK_SWITCH 4,UpdateWhisperingTrees

DoneUpdateWinScreenLogic

    BANK_SWITCH 0,DoneWinScreenLogic

WinScreenDraw subroutine

.LinesOfFrame

    lda #0
    sta COLUBK
    lda frameCounter
    sta COLUPF

    ldy #48
    ldx #192

.LVScan
    sta WSYNC
    lda WinnerBitmap0,Y
    sta PF0
    lda WinnerBitmap1,Y
    sta PF1
    lda WinnerBitmap2,Y
    sta PF2
    nop
    nop
    nop
    lda WinnerBitmap3,Y
    sta PF0
    lda WinnerBitmap4,Y
    sta PF1
    lda WinnerBitmap5,Y
    sta PF2

    dex
    txa
    and #$03
    bne .notDivisible_by_4
    
    dey

.notDivisible_by_4
    cpx #0 ;sets the Z flag based on X
    bne .LVScan

    lda #0
    sta PF0
    sta PF1
    sta PF2

    BANK_SWITCH 0,DoneWinScreenDraw

    include "Assets/Graphics/Backgrounds/WinnerData.asm"
