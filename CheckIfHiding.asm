CheckIfHiding

    ;Check if the player is hiding
    bit CXP0FB
    bpl .NoCollision

    ;yes, update to the sneaking state
    lda #1
    sta playerHiding
    jmp .DoneCollision

.NoCollision

    lda #0
    sta playerHiding

.DoneCollision

    sta CXCLR ;clear collision
    rts