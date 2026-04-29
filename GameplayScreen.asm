

GameplayScreenLogic subroutine

    ;reset the player velocity before checking input
    lda #0
    sta playerXVel
    sta playerYVel

    tay
    jsr UpdateInput

    lda #0
    tay
    jsr CheckInput

    lda #0
    tay
    jsr PerformScreenLogic

    lda #<Frame0        ; load low byte of Frame0 address
    sta spritePtr
    lda #>Frame0        ; load high byte of Frame0 address
    sta spritePtr+1

    lda #<ColorFrame0        ; load low byte of Frame0 address
    sta spriteColorPtr
    lda #>ColorFrame0        ; load high byte of Frame0 address
    sta spriteColorPtr+1

    ;Set the x position of the player
    lda playerXPos
    ldx #0
    jsr SetHorizPos

    sta WSYNC	; sync w/ scanline
    sta HMOVE	; apply fine offsets

    BANK_SWITCH 0,DoneGameplayScreenLogic

GameplayScreenDraw subroutine

    ;should never get here
    ;jmp PerformScreenDraw

    include "InputEngine.asm"
    include "DrawCharacter.asm"
    include "SetHorizPos.asm"
    include "CheckInput.asm"
    include "CharacterMovement.asm"
    include "UpdatePlayerPosition.asm"
    include "ScreenEngine/ScreenDrawData.asm"
    include "ScreenEngine/ScreenDrawEngine.asm"
    include "ScreenEngine/ScreenDrawSubroutines.asm"

    include "ScreenEngine/ScreenEngine.asm"
    include "ScreenEngine/ScreenLogicData.asm"
    include "ScreenEngine/ScreenLogicEngine.asm"
