
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
    sta p1PrevInput
    sta p2PrevInput
    sta p1Input
    sta p2Input

    ;jsr CenterPlayerX
    lda #SCREEN_RIGHT_EDGE
    lsr ;divide by 2
    
    sta playerXPos ;center horizontally

    ;jsr CenterPlayerY
    lda #SCREEN_TOP_EDGE
    lsr ;divide by 2
    sta playerYPos ;center vertically

    lda playerXPos
    sta playerPrevXPos
    lda playerYPos
    sta playerPrevYPos

    ;initialize the player velocity
    lda #0
    sta playerXVel
    sta playerYVel

    sta p1PrevInput
    sta p2PrevInput
    sta p1Input
    sta p2Input
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
    sta backgroundPtr3
    sta backgroundPtr3+1
    sta backgroundPtr4
    sta backgroundPtr4+1
    sta backgroundPtr5
    sta backgroundPtr5+1
    sta temp

    rts
