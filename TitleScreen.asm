

TitleScreenLogic subroutine

    ;Set the background to black
    lda #0
    sta COLUBK

    ;Set the foreground color to green
    lda #192
    sta COLUPF

    ;Is music playing?
    lda MUS_PLAYING
    beq .startMusic

    jsr MUSIC_UPDATE_Shadows_Gather
    jmp .doneMusic

.startMusic

    jsr MUSIC_STOP_Shadows_Gather
    jsr MUSIC_INIT_SHADOWS_GATHER

.doneMusic

    ;Start the game if the button is down
    bit INPT4
    bmi .skipButton

    ;stop the title screen music
    jsr MUSIC_STOP_Shadows_Gather

    ;change to gameplay mode
    lda #1
    sta gameMode

    ;Reset the game
    BANK_SWITCH 7,ResetGameplay

.skipButton

DoneResetGameplay

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
