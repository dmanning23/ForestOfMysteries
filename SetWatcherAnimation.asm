SetWatcherAnimation subroutine

    lda #<HellWatcherStanding1
    sta spritePtr
    lda #>HellWatcherStanding1
    sta spritePtr+1

    lda #<HellWatcherStandingColor1
    sta spriteColorPtr
    lda #>HellWatcherStandingColor1
    sta spriteColorPtr+1

    rts