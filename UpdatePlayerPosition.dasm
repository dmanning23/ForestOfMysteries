UpdatePlayerPosition subroutine
    lda playerXPos
    sta playerPrevXPos
    lda playerYPos
    sta playerPrevYPos
    
    jsr UpdateCharacterY
    jsr UpdateCharacterX
    
    rts

ScreenWraparound subroutine

    ;check if the player is behind the right wall
    lda playerXPos,y
    cmp #SCREEN_RIGHT_EDGE
    beq .leftOfRightEdge
    bcs .rightOfRightEdge

.leftOfRightEdge

    ;If the player is on the left side of the right wall

    ;Check if the player is behind the left wall
    lda playerXPos,y
    cmp #SCREEN_LEFT_EDGE
    bcc .leftOfLeftEdge

    ;...they are probably still on the screen?
    jmp .doneX

.rightOfRightEdge
    ;The player has walked off the right side of the screen
    jsr ScreenMoveRight
    jsr SetPlayerPosLeftEdge
    jmp .doneX

.leftOfLeftEdge
    ;Went off the left side of the screen
    jsr ScreenMoveLeft
    jsr SetPlayerPosRightEdge

.doneX

    ;Check if we are above the ceiling
    lda playerYPos,y
    cmp #SCREEN_TOP_EDGE
    beq .belowCeiling
    bcs .aboveCeiling

.belowCeiling

    ;If the player is below the ceiling

    ;Check if the player is below the floor
    lda playerYPos,y
    cmp #SCREEN_BOTTOM_EDGE
    bcc .belowFloor

    ;...they are probably still on the screen?
    jmp .doneY

.aboveCeiling
    ;The player has ended up above the ceiling
    jsr ScreenMoveUp
    jsr SetPlayerPosFloor
    jmp .doneY

.belowFloor:
    ;The player is below the floor
    jsr ScreenMoveDown
    jsr SetPlayerPosCeiling

.doneY
    rts