;This routine decides which character will be drawn this screen
WhichCharacter subroutine

    ;Is the current character the watcher?
    lda currentCharacter
    cmp #WATCHER
    beq .playerTurn

    ;is the current characyer the creep?
    lda currentCharacter
    cmp #CREEP
    beq .checkWatcher

    ;is the creep on this screen?
    lda creepScreenRow
    cmp screenRow
    bne .noCreepOnScreen

    lda creepScreenCol
    cmp screenCol
    bne .noCreepOnScreen

    ;The creep is on this screen
    lda #CREEP
    sta currentCharacter
    jmp .done

.noCreepOnScreen

.checkWatcher

    ;is the watcher on this screen?
    lda watcherScreenRow
    cmp screenRow
    bne .noWatcherOnScreen

    lda watcherScreenCol
    cmp screenCol
    bne .noWatcherOnScreen

    ;The watcher is on this screen
    lda #WATCHER
    sta currentCharacter
    jmp .done

.noWatcherOnScreen

.playerTurn

    lda #PLAYER
    sta currentCharacter
    jmp .done

.done

    rts