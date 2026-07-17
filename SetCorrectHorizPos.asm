SetCorrectHorizPos subroutine

    ;is the creep on this screen?
    lda creepScreenRow
    cmp screenRow
    bne .checkPlayerCollision

    lda creepScreenCol
    cmp screenCol
    bne .checkPlayerCollision

    ;The creep is on this screen

    ;Is this an even or odd frame?
    lda frameCounter
    lsr
    bcs .noCreepOnScreen    ; carry set = bit 0 was 1 = odd

    jsr CheckIfHiding
    jsr SetCreepHorizPos
    jmp .done

.checkPlayerCollision

    jsr CheckIfHiding

.noCreepOnScreen

    ;Only need to draw the player
    jsr SetPlayerHorizPos

.done

    sta WSYNC	; sync w/ scanline
    sta HMOVE	; apply fine offsets

    rts

SetPlayerHorizPos

    lda playerXPos1
    ldx #0
    jsr SetHorizPos

    rts

SetCreepHorizPos

    lda playerXPos2
    ldx #1
    jsr SetHorizPos

    rts

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
