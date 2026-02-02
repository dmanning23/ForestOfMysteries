CheckInput subroutine
    lda p1Input,y
    bit CONTROLLER_UP
    beq .doneCheckUp

    ; eor p1PrevInput,y
    ; bit CONTROLLER_UP
    ; beq .doneCheckUp

    ; jsr ScreenMoveUp
    lda #2
    sta playerYVel

.doneCheckUp

    lda p1Input,y
    bit CONTROLLER_DOWN
    beq .doneCheckDown

    ; eor p1PrevInput,y
    ; bit CONTROLLER_DOWN
    ; beq .doneCheckDown

    ; jsr ScreenMoveDown
    lda #-2
    sta playerYVel

.doneCheckDown

    lda p1Input,y
    bit CONTROLLER_LEFT
    beq .doneCheckLeft

    ; eor p1PrevInput,y
    ; bit CONTROLLER_LEFT
    ; beq .doneCheckLeft

    ; jsr ScreenMoveLeft
    lda #-1
    sta playerXVel

    ;flip the player left
    lda #%00001000
    sta REFP0

.doneCheckLeft

    lda p1Input,y
    bit CONTROLLER_RIGHT
    beq .doneCheckRight

    ; eor p1PrevInput,y
    ; bit CONTROLLER_RIGHT
    ; beq .doneCheckRight

    ; jsr ScreenMoveRight
    lda #1
    sta playerXVel
    
    ;flip the player right
    lda #0
    sta REFP0

.doneCheckRight
    rts