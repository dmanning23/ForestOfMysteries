CheckInput subroutine

    lda p1Input,y
    bit CONTROLLER_UP
    beq .doneCheckUp

    lda #2
    sta playerYVel

.doneCheckUp



    lda p1Input,y
    bit CONTROLLER_DOWN
    beq .doneCheckDown

    lda #-2
    sta playerYVel

.doneCheckDown



    lda p1Input,y
    bit CONTROLLER_LEFT
    beq .doneCheckLeft

    lda #-1
    sta playerXVel

    ;flip the player left
    lda #%00001000
    sta REFP0

.doneCheckLeft



    lda p1Input,y
    bit CONTROLLER_RIGHT
    beq .doneCheckRight

    lda #1
    sta playerXVel
    
    ;flip the player right
    lda #0
    sta REFP0

.doneCheckRight

    rts