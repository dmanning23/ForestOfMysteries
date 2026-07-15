SetPlayerState subroutine

    ;Check if the button is held
    lda playerInput1,y
    bit CONTROLLER_BUTTON
    beq .buttonNo

    ;button is being held

    ;check if playerInput1 is greater than 1 (player joystick is held)
    lda playerInput1,y
    cmp #CONTROLLER_BUTTON+1
    bcs .buttonYesJoystickYes

    ;button held and joystick not held, set player state to crouching
    lda #PLAYER_CROUCHING
    sta playerState1

    jmp .doneInitialSetPlayerStateLogic

.buttonYesJoystickYes

    ;Button held and player moving, set player state to walking
    lda #PLAYER_SNEAKING
    sta playerState1

    jmp .doneInitialSetPlayerStateLogic

.buttonNo
    ;The button is not being held

    ;check if playerInput1 is greater than 1 (player joystick is held)
    lda playerInput1,y
    cmp #CONTROLLER_BUTTON+1
    bcs .buttonNoJoystickYes

    ;button not held and joystick not held, set player state to walking
    lda #PLAYER_STANDING
    sta playerState1,y

    jmp .doneInitialSetPlayerStateLogic

.buttonNoJoystickYes

    ;Button not held and player moving, set player state to walking
    lda #PLAYER_WALKING
    sta playerState1,y

.doneInitialSetPlayerStateLogic

    ;Check if the player is hiding
    bit CXP0FB
    bpl .NoCollion

    ;yes, update to the sneaking state
    lda playerState1,y
    clc
    adc #PLAYER_STAND_HIDING
    sta playerState1,y

.NoCollion

    ;no, there is no state change

.DoneCollision

    sta CXCLR ;clear collision

    ;Done setting the player's state
    rts