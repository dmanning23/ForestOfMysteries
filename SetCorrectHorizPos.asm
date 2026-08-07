SetCorrectHorizPos subroutine

    ;is the player the current character?
    lda currentCharacter
    cmp #PLAYER
    bne .checkCreep

    ;the player is the current character
    jsr SetPlayerHorizPos
    jmp .done

.checkCreep

    ;is the creep the current character?
    lda currentCharacter
    cmp #CREEP
    bne .checkWatcher

    ;the creep is the current character
    jsr SetCreepHorizPos
    jmp .done

.checkWatcher

    ;the watcher is the current character
    jsr SetWatcherHorizPos

.done

    sta WSYNC	; sync w/ scanline
    sta HMOVE	; apply fine offsets

    rts



SetPlayerHorizPos

    lda playerXPos1
    ldx 0
    jsr SetHorizPos

    rts

SetCreepHorizPos

    lda creepXPos
    ldx 0
    jsr SetHorizPos

    rts

SetWatcherHorizPos

    lda watcherXPos
    ldx 0
    jsr SetHorizPos

    rts
