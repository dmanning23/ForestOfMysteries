UpdatePlayerPosition subroutine
    lda playerXPos1
    sta playerPrevXPos
    lda playerYPos1
    sta playerPrevYPos
    
    jsr UpdateCharacterY
    jsr UpdateCharacterX
    
    rts

ScreenWraparoundAll subroutine

    ;check if the player is behind the right wall
    lda playerXPos1,y
    cmp #SCREEN_RIGHT_EDGE
    beq .leftOfRightEdge
    bcs .rightOfRightEdge

.leftOfRightEdge

    ;If the player is on the left side of the right wall

    ;Check if the player is behind the left wall
    lda playerXPos1,y
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
    lda playerYPos1,y
    cmp #SCREEN_TOP_EDGE
    beq .belowCeiling
    bcs .aboveCeiling

.belowCeiling

    ;If the player is below the ceiling

    ;Check if the player is below the floor
    lda playerYPos1,y
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

ScreenWraparoundRightBottom subroutine

    ;check if the player is behind the right wall
    lda playerXPos1,y
    cmp #SCREEN_RIGHT_EDGE
    beq .leftOfRightEdge
    bcs .rightOfRightEdge

.leftOfRightEdge

    ;If the player is on the left side of the right wall

    ;Check if the player is behind the left wall
    lda playerXPos1,y
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
    jsr SetPlayerPosLeftEdge ;No going off left edge in this screen

.doneX

    ;Check if we are above the ceiling
    lda playerYPos1,y
    cmp #SCREEN_TOP_EDGE
    beq .belowCeiling
    bcs .aboveCeiling

.belowCeiling

    ;If the player is below the ceiling

    ;Check if the player is below the floor
    lda playerYPos1,y
    cmp #SCREEN_BOTTOM_EDGE
    bcc .belowFloor

    ;...they are probably still on the screen?
    jmp .doneY

.aboveCeiling
    ;The player has ended up above the ceiling
    jsr ScreenMoveUp
    jsr SetPlayerPosCeiling ;No going off the cieling on this screen
    jmp .doneY

.belowFloor:
    ;The player is below the floor
    jsr ScreenMoveDown
    jsr SetPlayerPosCeiling

.doneY
    rts

ScreenWraparoundLeftRightBottom subroutine

    ;check if the player is behind the right wall
    lda playerXPos1,y
    cmp #SCREEN_RIGHT_EDGE
    beq .leftOfRightEdge
    bcs .rightOfRightEdge

.leftOfRightEdge

    ;If the player is on the left side of the right wall

    ;Check if the player is behind the left wall
    lda playerXPos1,y
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
    lda playerYPos1,y
    cmp #SCREEN_TOP_EDGE
    beq .belowCeiling
    bcs .aboveCeiling

.belowCeiling

    ;If the player is below the ceiling

    ;Check if the player is below the floor
    lda playerYPos1,y
    cmp #SCREEN_BOTTOM_EDGE
    bcc .belowFloor

    ;...they are probably still on the screen?
    jmp .doneY

.aboveCeiling
    ;The player has ended up above the ceiling
    jsr ScreenMoveUp
    jsr SetPlayerPosCeiling ;No going off the cieling on this screen
    jmp .doneY

.belowFloor:
    ;The player is below the floor
    jsr ScreenMoveDown
    jsr SetPlayerPosCeiling

.doneY
    rts

ScreenWraparoundLeftBottom subroutine

    ;check if the player is behind the right wall
    lda playerXPos1,y
    cmp #SCREEN_RIGHT_EDGE
    beq .leftOfRightEdge
    bcs .rightOfRightEdge

.leftOfRightEdge

    ;If the player is on the left side of the right wall

    ;Check if the player is behind the left wall
    lda playerXPos1,y
    cmp #SCREEN_LEFT_EDGE
    bcc .leftOfLeftEdge

    ;...they are probably still on the screen?
    jmp .doneX

.rightOfRightEdge
    ;The player has walked off the right side of the screen
    jsr ScreenMoveRight
    jsr SetPlayerPosRightEdge ;No going off right edge on this screen
    jmp .doneX

.leftOfLeftEdge
    ;Went off the left side of the screen
    jsr ScreenMoveLeft
    jsr SetPlayerPosRightEdge

.doneX

    ;Check if we are above the ceiling
    lda playerYPos1,y
    cmp #SCREEN_TOP_EDGE
    beq .belowCeiling
    bcs .aboveCeiling

.belowCeiling

    ;If the player is below the ceiling

    ;Check if the player is below the floor
    lda playerYPos1,y
    cmp #SCREEN_BOTTOM_EDGE
    bcc .belowFloor

    ;...they are probably still on the screen?
    jmp .doneY

.aboveCeiling
    ;The player has ended up above the ceiling
    jsr ScreenMoveUp
    jsr SetPlayerPosCeiling ;No going off the cieling on this screen
    jmp .doneY

.belowFloor:
    ;The player is below the floor
    jsr ScreenMoveDown
    jsr SetPlayerPosCeiling

.doneY
    rts

ScreenWraparoundRightTopBottom subroutine

    ;check if the player is behind the right wall
    lda playerXPos1,y
    cmp #SCREEN_RIGHT_EDGE
    beq .leftOfRightEdge
    bcs .rightOfRightEdge

.leftOfRightEdge

    ;If the player is on the left side of the right wall

    ;Check if the player is behind the left wall
    lda playerXPos1,y
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
    jsr SetPlayerPosLeftEdge ;No going off left edge

.doneX

    ;Check if we are above the ceiling
    lda playerYPos1,y
    cmp #SCREEN_TOP_EDGE
    beq .belowCeiling
    bcs .aboveCeiling

.belowCeiling

    ;If the player is below the ceiling

    ;Check if the player is below the floor
    lda playerYPos1,y
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

ScreenWraparoundRightTop subroutine

    ;check if the player is behind the right wall
    lda playerXPos1,y
    cmp #SCREEN_RIGHT_EDGE
    beq .leftOfRightEdge
    bcs .rightOfRightEdge

.leftOfRightEdge

    ;If the player is on the left side of the right wall

    ;Check if the player is behind the left wall
    lda playerXPos1,y
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
    jsr SetPlayerPosLeftEdge ;No going off left edge

.doneX

    ;Check if we are above the ceiling
    lda playerYPos1,y
    cmp #SCREEN_TOP_EDGE
    beq .belowCeiling
    bcs .aboveCeiling

.belowCeiling

    ;If the player is below the ceiling

    ;Check if the player is below the floor
    lda playerYPos1,y
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
    jsr SetPlayerPosFloor ;No going off bottom

.doneY
    rts

ScreenWraparoundLeftRightTop subroutine

    ;check if the player is behind the right wall
    lda playerXPos1,y
    cmp #SCREEN_RIGHT_EDGE
    beq .leftOfRightEdge
    bcs .rightOfRightEdge

.leftOfRightEdge

    ;If the player is on the left side of the right wall

    ;Check if the player is behind the left wall
    lda playerXPos1,y
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
    lda playerYPos1,y
    cmp #SCREEN_TOP_EDGE
    beq .belowCeiling
    bcs .aboveCeiling

.belowCeiling

    ;If the player is below the ceiling

    ;Check if the player is below the floor
    lda playerYPos1,y
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
    jsr SetPlayerPosFloor ;No going off bottom

.doneY
    rts

ScreenWraparoundLeftTop subroutine

    ;check if the player is behind the right wall
    lda playerXPos1,y
    cmp #SCREEN_RIGHT_EDGE
    beq .leftOfRightEdge
    bcs .rightOfRightEdge

.leftOfRightEdge

    ;If the player is on the left side of the right wall

    ;Check if the player is behind the left wall
    lda playerXPos1,y
    cmp #SCREEN_LEFT_EDGE
    bcc .leftOfLeftEdge

    ;...they are probably still on the screen?
    jmp .doneX

.rightOfRightEdge
    ;The player has walked off the right side of the screen
    jsr ScreenMoveRight
    jsr SetPlayerPosRightEdge ;No going off right edge
    jmp .doneX

.leftOfLeftEdge
    ;Went off the left side of the screen
    jsr ScreenMoveLeft
    jsr SetPlayerPosRightEdge

.doneX

    ;Check if we are above the ceiling
    lda playerYPos1,y
    cmp #SCREEN_TOP_EDGE
    beq .belowCeiling
    bcs .aboveCeiling

.belowCeiling

    ;If the player is below the ceiling

    ;Check if the player is below the floor
    lda playerYPos1,y
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
    jsr SetPlayerPosFloor ;No going off bottom

.doneY
    rts

ScreenWraparoundLeftTopBottom subroutine

    ;check if the player is behind the right wall
    lda playerXPos1,y
    cmp #SCREEN_RIGHT_EDGE
    beq .leftOfRightEdge
    bcs .rightOfRightEdge

.leftOfRightEdge

    ;If the player is on the left side of the right wall

    ;Check if the player is behind the left wall
    lda playerXPos1,y
    cmp #SCREEN_LEFT_EDGE
    bcc .leftOfLeftEdge

    ;...they are probably still on the screen?
    jmp .doneX

.rightOfRightEdge
    ;The player has walked off the right side of the screen
    jsr ScreenMoveRight
    jsr SetPlayerPosRightEdge ;No going off right edge
    jmp .doneX

.leftOfLeftEdge
    ;Went off the left side of the screen
    jsr ScreenMoveLeft
    jsr SetPlayerPosRightEdge

.doneX

    ;Check if we are above the ceiling
    lda playerYPos1,y
    cmp #SCREEN_TOP_EDGE
    beq .belowCeiling
    bcs .aboveCeiling

.belowCeiling

    ;If the player is below the ceiling

    ;Check if the player is below the floor
    lda playerYPos1,y
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