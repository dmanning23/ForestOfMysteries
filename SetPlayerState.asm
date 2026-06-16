SetPlayerState subroutine

    ;Check if the button is held
    lda p1Input,y
    bit CONTROLLER_BUTTON
    beq .buttonNo

    ;button is being held

    ;check if p1Input is greater than 1 (player joystick is held)
    lda p1Input,y
    cmp #CONTROLLER_BUTTON+1
    bcs .buttonYesJoystickYes

    ;button held and joystick not held, set player state to crouching
    lda #PLAYER_CROUCHING
    sta p1State

    jmp .doneInitialSetPlayerStateLogic

.buttonYesJoystickYes

    ;Button held and player moving, set player state to walking
    lda #PLAYER_SNEAKING
    sta p1State

    jmp .doneInitialSetPlayerStateLogic

.buttonNo
    ;The button is not being held

    ;check if p1Input is greater than 1 (player joystick is held)
    lda p1Input,y
    cmp #CONTROLLER_BUTTON+1
    bcs .buttonNoJoystickYes

    ;button not held and joystick not held, set player state to walking
    lda #PLAYER_STANDING
    sta p1State,y

    jmp .doneInitialSetPlayerStateLogic

.buttonNoJoystickYes

    ;Button not held and player moving, set player state to walking
    lda #PLAYER_WALKING
    sta p1State,y

.doneInitialSetPlayerStateLogic

    ;Check if the player is hiding
    bit CXP0FB
    bpl .NoCollion

    ;yes, update to the sneaking state
    lda p1State,y
    clc
    adc #PLAYER_STAND_HIDING
    sta p1State,y

.NoCollion

    ;no, there is no state change

.DoneCollision

    sta CXCLR ;clear collision

    ;Done setting the player's state
    rts