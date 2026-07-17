SetCorrectHorizPos subroutine

    ;is the creep on this screen?
    lda creepScreenRow
    cmp screenRow
    bne .noCreepOnScreen

    lda creepScreenCol
    cmp screenCol
    bne .noCreepOnScreen

    ;The creep is on this screen

    ;Is this an even or odd frame?
    lda frameCounter
    lsr
    bcs .noCreepOnScreen    ; carry set = bit 0 was 1 = odd

    jsr SetCreepHorizPos
    jmp .done

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