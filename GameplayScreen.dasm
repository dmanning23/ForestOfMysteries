

GameplayScreenLogic subroutine

    ;reset the player velocity before checking input
    lda #0
    sta playerXVel
    sta playerYVel

    jsr UpdateInput

    jsr CheckInput

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

    ;Load the player number into Y
    lda #0
    tay

    BANK_SWITCH 0,DoneGameplayScreenLogic



GameplayScreenDraw subroutine

    jsr PerformScreenDraw

    BANK_SWITCH 0,DoneGameplayScreenDraw



    include "InputEngine.dasm"
    include "DrawCharacter.dasm"
    include "Assets/Graphics/player.dasm"
    include "SetHorizPos.dasm"
    include "CheckInput.dasm"
    include "CharacterMovement.dasm"
    include "UpdatePlayerPosition.dasm"
    include "ScreenEngine/ScreenDrawData.dasm"
    include "ScreenEngine/ScreenDrawEngine.dasm"
    include "ScreenEngine/ScreenDrawSubroutines.dasm"
    include "ScreenEngine/ScreenEngine.dasm"
    include "ScreenEngine/ScreenLogicData.dasm"
    include "ScreenEngine/ScreenLogicEngine.dasm"
    include "Assets/Graphics/Backgrounds/FoM_1Data.asm"


