;This will be required in the Constants section of your game:

; ;The input flags are as follows:
; CONTROLLER_DOWN     equ #%00000001
; CONTROLLER_UP       equ #%00000010
; CONTROLLER_LEFT     equ #%00000100
; CONTROLLER_RIGHT    equ #%00001000
; CONTROLLER_BUTTON   equ #%00010000

;This will be required in the Variables section of your game:

; ;The player's input from the previous frame
; p1PrevInput byte
; p2PrevInput byte

; ;The player's input from the current frame
; p1Input byte
; p2Input byte

; ;This variable is used to mask the controller input to map to p1 or p2
; controllerMask .byte 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Call this in the initialization part of your game to initialize the input variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
InitializeInput
    lda #0
    sta p1PrevInput
    sta p2PrevInput
    sta p1Input
    sta p2Input
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Call this during the main game loop to update all the input for a player.
; The Y register should hold either 0 or 1, depending on which player's controller is being checked.
; This is going to use the A register as well, so just keep that in mind
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UpdateInput subroutine
    ;copy current input to prev
    lda p1Input,y
    sta p1PrevInput,y

    ;blank out the current input
    lda #0
    sta p1Input,y

.SetControllerMask 

    ;set the controller mask properly depending on which player we are updating
    beq .setP1ControllerMask
    lda #%00001111 ;check p2 joystick
    sta controllerMask
    jmp .doneSettingControllerMask

.setP1ControllerMask
    lda #%11110000 ;this mask is used by the MoveJoystick routine to check p1 joystick
    sta controllerMask

.doneSettingControllerMask

.CheckDown
    ;check if the down direction is being held
    lda #%00100010	;down?
    and controllerMask
    bit SWCHA
    bne .CheckUp

    ;set the down flag for the current input
    lda p1Input,y
    ora #CONTROLLER_DOWN
    sta p1Input,y

.CheckUp
    ;check if the up direction is being held
    lda #%00010001	;Up?
    and controllerMask
    bit SWCHA
    bne .CheckLeft

    ;set the up flag for teh current input
    lda p1Input,y
    ora #CONTROLLER_UP
    sta p1Input,y

.CheckLeft
    ;check if the left direction is being held
    lda #%01000100	;left?
    and controllerMask
    bit SWCHA
    bne .CheckRight

    ;set the "left" flag for teh current input
    lda p1Input,y
    ora #CONTROLLER_LEFT
    sta p1Input,y

.CheckRight
    ;check if the left direction is being held
    lda #%10001000	;right?
    and controllerMask
    bit SWCHA
    bne .CheckButton

    ;set the "right" flag for teh current input
    lda p1Input,y
    ora #CONTROLLER_RIGHT
    sta p1Input,y

.CheckButton
    ;are we checking p1 or p2? There is a different register depending on which one.
    tya
    cmp #01
    beq .checkP2Button

.checkP1Button
    lda #%10000000 ;Check if the button is pressed on the first controller
    bit INPT4
    beq .setButtonFlag
    jmp .DoneCheckingInput

.checkP2Button
    lda #%10000000 ;Check if the button is pressed on the second controller
    bit INPT5
    beq .setButtonFlag
    jmp .DoneCheckingInput

.setButtonFlag
    ;set the "button" flag for teh current input
    lda p1Input,y
    ora #CONTROLLER_BUTTON
    sta p1Input,y

.DoneCheckingInput
    rts

;Now to check if a direction is being held, do something like:

;CheckMoveLeft
    ;;load the player's input to the accumulator
    ;lda p1Input,y

    ;;Check if the left direction is being held down
    ;bit CONTROLLER_LEFT

    ;beq CheckMoveRight

    ;;ADD MOVE LEFT LOGIC HERE, ETC.

;CheckMoveRight


;To check input with debouncing:

;CheckButtonAttack subroutine
    ;;check for the button press
    ;lda p1Input,y ;is the button currently held?
    ;bit CONTROLLER_BUTTON
    ;beq .doneCheckButtonAttack

    ;;The button direction is currently being held, but is it a new input?
    ;eor p1PrevInput,y
    ;bit CONTROLLER_BUTTON
    ;beq .doneCheckButtonAttack

    ;;ADD ATTACK LOGIC HERE, ETC.

;.doneCheckButtonAttack