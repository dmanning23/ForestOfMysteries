
ResetGameplay subroutine
    ;change the current screen
    lda #0
    sta screenRow
    sta screenCol

    lda #1
    sta creepScreenRow
    sta creepScreenCol

    ;jsr InitializeScreenInput
    lda #0
    sta screenRow
    sta screenCol
    sta TempWord
    sta TempWord+1

    ;jsr InitializeInput
    lda #0
    sta playerPrevInput1
    ;sta playerPrevInput2
    sta playerInput1
    ;sta playerInput2

    sta playerHiding

    ;jsr CenterPlayerX
    lda #SCREEN_RIGHT_EDGE
    lsr ;divide by 2
    
    sta playerXPos1 ;center horizontally
    sta playerXPos2

    ;jsr CenterPlayerY
    lda #SCREEN_TOP_EDGE
    lsr ;divide by 2
    sta playerYPos1 ;center vertically
    sta playerYPos2

    lda playerXPos1
    sta playerPrevXPos
    lda playerYPos1
    sta playerPrevYPos

    lda playerXPos2
    ;sta playerPrevXPos
    lda playerYPos2
    ;sta playerPrevYPos

    ;initialize the player velocity
    lda #0
    sta playerXVel
    sta playerYVel
    sta playerState1
    sta playerState2

    sta controllerMask

    sta playerSpritePtr
    sta playerSpritePtr+1
    sta playerSpriteColorPtr
    sta playerSpriteColorPtr+1

    sta creepSpritePtr
    sta creepSpritePtr+1
    sta creepSpriteColorPtr
    sta creepSpriteColorPtr+1

    sta backgroundPtr0
    sta backgroundPtr0+1
    sta backgroundPtr1
    sta backgroundPtr1+1
    sta backgroundPtr2
    sta backgroundPtr2+1
    sta backgroundPtr3
    sta backgroundPtr3+1
    sta backgroundPtr4
    sta backgroundPtr4+1
    sta backgroundPtr5
    sta backgroundPtr5+1
    sta temp
    sta frameCounter

    ;Set the sprite widths
    lda #0
    sta NUSIZ0
    lda #5
    sta NUSIZ1

    rts
