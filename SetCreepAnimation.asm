SetCreepAnimation subroutine

    lda #<PurpleCreepStanding1
    sta spritePtr
    lda #>PurpleCreepStanding1
    sta spritePtr+1

    lda #<PurpleCreepStandingColor1
    sta spriteColorPtr
    lda #>PurpleCreepStandingColor1
    sta spriteColorPtr+1

    rts