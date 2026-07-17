SetCreepAnimation subroutine

    lda #<PurpleCreepStanding1
    sta creepSpritePtr
    lda #>PurpleCreepStanding1
    sta creepSpritePtr+1

    lda #<PurpleCreepStandingColor1
    sta creepSpriteColorPtr
    lda #>PurpleCreepStandingColor1
    sta creepSpriteColorPtr+1

    rts