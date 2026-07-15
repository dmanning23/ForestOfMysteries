
ResetGameplay subroutine
    ;change the current screen
    lda #0
    sta screenRow
    sta screenCol

    ;jsr InitializeScreenInput
    lda #0
    sta screenRow
    sta screenCol
    sta TempWord
    sta TempWord+1

    ;jsr InitializeInput
    lda #0
    sta playerPrevInput1
    ;sta p2PrevInput
    sta playerInput1
    ;sta p2Input

    ;jsr CenterPlayerX
    lda #SCREEN_RIGHT_EDGE
    lsr ;divide by 2
    
    sta playerXPos1 ;center horizontally

    ;jsr CenterPlayerY
    lda #SCREEN_TOP_EDGE
    lsr ;divide by 2
    sta playerYPos1 ;center vertically

    lda playerXPos1
    sta playerPrevXPos
    lda playerYPos1
    sta playerPrevYPos

    ;initialize the player velocity
    lda #0
    sta playerXVel
    sta playerYVel
    sta playerState1

    sta controllerMask

    sta spritePtr1
    sta spritePtr1+1
    sta spriteColorPtr1
    sta spriteColorPtr1+1

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

    rts
