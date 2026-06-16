CheckInput subroutine
    lda p1Input,y
    bit CONTROLLER_UP
    beq .doneCheckUp

    ;is the player walking?
    lda p1State,y
    cmp #PLAYER_WALKING
    beq .setUpWalkVelocity

    ;is the player walking but hidden?
    lda p1State,y
    cmp #PLAYER_WALK_HIDING
    beq .setUpWalkVelocity

    ;is the player sneaking?
    lda p1State,y
    cmp #PLAYER_SNEAKING
    beq .setUpSneakVelocity

    ;is the player sneaking but hiding?
    lda p1State,y
    cmp #PLAYER_SNEAKING
    beq .setUpSneakVelocity

    jmp .doneCheckUp

.setUpWalkVelocity

    lda #4
    sta playerYVel
    jmp .doneCheckUp

.setUpSneakVelocity

    lda #2
    sta playerYVel
    jmp .doneCheckUp

.doneCheckUp



    lda p1Input,y
    bit CONTROLLER_DOWN
    beq .doneCheckDown

    ;is the player walking?
    lda p1State,y
    cmp #PLAYER_WALKING
    beq .setDownWalkVelocity

    ;is the player walking but hidden?
    lda p1State,y
    cmp #PLAYER_WALK_HIDING
    beq .setDownWalkVelocity

    ;is the player sneaking?
    lda p1State,y
    cmp #PLAYER_SNEAKING
    beq .setDownSneakVelocity

    ;is the player sneaking but hiding?
    lda p1State,y
    cmp #PLAYER_SNEAKING
    beq .setDownSneakVelocity

    jmp .doneCheckDown

.setDownWalkVelocity

    lda #-4
    sta playerYVel
    jmp .doneCheckDown

.setDownSneakVelocity

    lda #-2
    sta playerYVel
    jmp .doneCheckDown

.doneCheckDown



    lda p1Input,y
    bit CONTROLLER_LEFT
    beq .doneCheckLeft

    ;is the player walking?
    lda p1State,y
    cmp #PLAYER_WALKING
    beq .setLeftWalkVelocity

    ;is the player walking but hidden?
    lda p1State,y
    cmp #PLAYER_WALK_HIDING
    beq .setLeftWalkVelocity

    ;is the player sneaking?
    lda p1State,y
    cmp #PLAYER_SNEAKING
    beq .setLeftSneakVelocity

    ;is the player sneaking but hiding?
    lda p1State,y
    cmp #PLAYER_SNEAKING
    beq .setLeftSneakVelocity

    jmp .doneCheckLeft

.setLeftWalkVelocity

    lda #-4
    sta playerXVel

    ;flip the player left
    lda #%00001000
    sta REFP0

    jmp .doneCheckLeft

.setLeftSneakVelocity

    lda #-2
    sta playerXVel

    ;flip the player left
    lda #%00001000
    sta REFP0

    jmp .doneCheckLeft

.doneCheckLeft



    lda p1Input,y
    bit CONTROLLER_RIGHT
    beq .doneCheckRight

    ;is the player walking?
    lda p1State,y
    cmp #PLAYER_WALKING
    beq .setRightWalkVelocity

    ;is the player walking but hidden?
    lda p1State,y
    cmp #PLAYER_WALK_HIDING
    beq .setRightWalkVelocity

    ;is the player sneaking?
    lda p1State,y
    cmp #PLAYER_SNEAKING
    beq .setRightSneakVelocity

    ;is the player sneaking but hiding?
    lda p1State,y
    cmp #PLAYER_SNEAKING
    beq .setRightSneakVelocity

    jmp .doneCheckRight

.setRightWalkVelocity

    lda #4
    sta playerXVel
    
    ;flip the player right
    lda #0
    sta REFP0

    jmp .doneCheckRight

.setRightSneakVelocity

    lda #2
    sta playerXVel
    
    ;flip the player right
    lda #0
    sta REFP0

    jmp .doneCheckRight

.doneCheckRight

    rts