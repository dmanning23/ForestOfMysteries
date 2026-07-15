SetPlayerAnimation subroutine


; PLAYER_STAND_HIDING
; PLAYER_CROUCHING
; PLAYER_CROUCH_HIDING
; PLAYER_WALKING
; PLAYER_WALK_HIDING
; PLAYER_SNEAKING
; PLAYER_SNEAK_HIDING
; PLAYER_STANDING

.checkStand_Hiding
    lda playerState1,y
    cmp #PLAYER_STAND_HIDING
    bne .checkCrouching

    lda #<PlayerStand_Hiding1
    sta spritePtr1
    lda #>PlayerStand_Hiding1
    sta spritePtr1+1

    lda #<PlayerStand_HidingColor1
    sta spriteColorPtr1
    lda #>PlayerStand_HidingColor1
    sta spriteColorPtr1+1

    jmp .done

.checkCrouching
    lda playerState1,y
    cmp #PLAYER_CROUCHING
    bne .checkCrouch_Hiding

    lda #<PlayerCrouching1
    sta spritePtr1
    lda #>PlayerCrouching1
    sta spritePtr1+1

    lda #<PlayerCrouchingColor1
    sta spriteColorPtr1
    lda #>PlayerCrouchingColor1
    sta spriteColorPtr1+1

    jmp .done

.checkCrouch_Hiding
    lda playerState1,y
    cmp #PLAYER_CROUCH_HIDING
    bne .checkWalking

    lda #<PlayerCrouch_Hiding1
    sta spritePtr1
    lda #>PlayerCrouch_Hiding1
    sta spritePtr1+1

    lda #<PlayerCrouch_HidingColor1
    sta spriteColorPtr1
    lda #>PlayerCrouch_HidingColor1
    sta spriteColorPtr1+1

    jmp .done

.checkWalking
    lda playerState1,y
    cmp #PLAYER_WALKING
    bne .checkWalk_Hiding

    lda #<PlayerWalking1
    sta spritePtr1
    lda #>PlayerWalking1
    sta spritePtr1+1

    lda #<PlayerWalkingColor1
    sta spriteColorPtr1
    lda #>PlayerWalkingColor1
    sta spriteColorPtr1+1

    jmp .done

.checkWalk_Hiding
    lda playerState1,y
    cmp #PLAYER_WALK_HIDING
    bne .checkSneaking

    lda #<PlayerWalk_Hiding1
    sta spritePtr1
    lda #>PlayerWalk_Hiding1
    sta spritePtr1+1

    lda #<PlayerWalk_HidingColor1
    sta spriteColorPtr1
    lda #>PlayerWalk_HidingColor1
    sta spriteColorPtr1+1

    jmp .done

.checkSneaking
    lda playerState1,y
    cmp #PLAYER_SNEAKING
    bne .checkSneak_Hiding

    lda #<PlayerSneaking1
    sta spritePtr1
    lda #>PlayerSneaking1
    sta spritePtr1+1

    lda #<PlayerSneakingColor1
    sta spriteColorPtr1
    lda #>PlayerSneakingColor1
    sta spriteColorPtr1+1

    jmp .done

.checkSneak_Hiding
    lda playerState1,y
    cmp #PLAYER_SNEAK_HIDING
    bne .checkStanding

    lda #<PlayerSneak_Hiding1
    sta spritePtr1
    lda #>PlayerSneak_Hiding1
    sta spritePtr1+1

    lda #<PlayerSneak_HidingColor1
    sta spriteColorPtr1
    lda #>PlayerSneak_HidingColor1
    sta spriteColorPtr1+1

    jmp .done

.checkStanding

    ;Something happened, default to standing sprite?
    lda #<PlayerStanding1
    sta spritePtr1
    lda #>PlayerStanding1
    sta spritePtr1+1

    lda #<PlayerStandingColor1
    sta spriteColorPtr1
    lda #>PlayerStandingColor1
    sta spriteColorPtr1+1

.done

    rts