

TitleScreenLogic subroutine

    ;Set the background to black
    lda #0
    sta COLUBK

    ;Set the foreground color to green
    

    ;Is music playing?
    lda MUS_PLAYING
    beq .startMusic

    lda #$0B
    sta COLUPF

    jsr MUSIC_UPDATE_Shadows_Gather
    jmp .doneMusic

.startMusic

    jsr MUSIC_STOP_Shadows_Gather
    jsr MUSIC_INIT_Shadows_Gather

.doneMusic

    BANK_SWITCH 0,DoneTitleScreenLogic



TitleScreenDraw subroutine

.linesOfFrame

    ldy #192
    ldx #192

.lVScan
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
    bne .notDivisible_by_4
    
    dey

.notDivisible_by_4
    cpx #0 ;sets the Z flag based on X
    bne .lVScan

    BANK_SWITCH 0,DoneTitleScreenDraw



    include "Assets/Graphics/FoM_TitleScreenData.asm"
    include "Sound/shadows_gather-music.asm"
    include "Sound/shadows_gather-MusicEngine.asm"


