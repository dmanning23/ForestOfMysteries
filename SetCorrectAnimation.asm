SetCorrectAnimation subroutine

    ;is the player the current character?
    lda currentCharacter
    cmp #PLAYER
    bne .checkCreep

    ;the player is the current character

    ;single width sprite
    lda #0
    sta NUSIZ0

    ;set the animation
    jsr SetPlayerAnimation

    ;flip the character if necesasry
    lda playerFlipped
    sta REFP0

    jmp .done

.checkCreep

    ;is the creep the current character?
    lda currentCharacter
    cmp #CREEP
    bne .checkWatcher

    ;the creep is the current character
    lda #5
    sta NUSIZ0
    jsr SetCreepAnimation
    lda creepFlipped
    sta REFP0
    jmp .done

.checkWatcher

    ;the creep is the current character
    lda #5
    sta NUSIZ0
    jsr SetWatcherAnimation
    lda watcherFlipped
    sta REFP0

.done

    sta WSYNC	; sync w/ scanline
    sta HMOVE	; apply fine offsets

    rts
