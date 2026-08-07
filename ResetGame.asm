
ResetGameplay subroutine
    ;change the current screen
    lda #0
    sta screenRow
    sta screenCol

    lda #1
    sta creepScreenRow
    sta creepScreenCol
    sta watcherScreenRow
    sta watcherScreenCol

    ;jsr InitializeScreenInput
    lda #0
    sta screenRow
    sta screenCol
    sta TempWord
    sta TempWord+1

    ;jsr InitializeInput
    lda #0
    sta playerPrevInput1
    sta playerInput1

    sta playerHiding

    sta currentCharacter

    ;jsr CenterPlayerX
    lda #SCREEN_RIGHT_EDGE
    lsr ;divide by 2
    
    sta playerXPos1 ;center horizontally
    sta creepXPos
    lsr
    sta watcherXPos

    ;jsr CenterPlayerY
    lda #SCREEN_TOP_EDGE
    lsr ;divide by 2
    sta playerYPos1 ;center vertically
    sta creepYPos
    lsr
    sta watcherYPos

    lda playerXPos1
    sta playerPrevXPos
    lda playerYPos1
    sta playerPrevYPos

    ;initialize the player velocity
    lda #0
    sta playerXVel
    sta playerYVel
    sta playerState1

    sta playerFlipped
    sta creepFlipped
    sta watcherFlipped

    sta controllerMask

    sta spritePtr
    sta spritePtr+1
    sta spriteColorPtr
    sta spriteColorPtr+1

    sta backgroundPtr0
    sta backgroundPtr0+1
    sta backgroundPtr1
    sta backgroundPtr1+1
    sta backgroundPtr2
    sta backgroundPtr2+1
    sta temp
    sta frameCounter

    lda #1
    sta CTRLPF	; symmetry

    rts
