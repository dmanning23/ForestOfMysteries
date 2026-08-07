GameplayScreenLogic subroutine

    ;update the frame counter
    inc frameCounter

    ;reset the player velocity before checking input
    lda #0
    sta playerXVel
    sta playerYVel

    ;Grab the input from the controller
    tay
    jsr UpdateInput

    ;Set the state based on the current game and controller states
    lda #0
    tay
    jsr SetPlayerState

    lda #0
    tay
    jsr CheckInput

    lda #0
    tay
    jsr PerformScreenLogic

    ;If the player was the last character, check if they are hiding
    jsr CheckIfHiding

    ;Which character is being drawn this refresh?
    jsr WhichCharacter

    jsr SetCorrectAnimation
    jsr SetCorrectHorizPos

    ;Update the sound engine
    BANK_SWITCH 4,UpdateWhisperingTrees

DoneUpdateGameplayScreenLogic

    ; ;TEST: Show the win screen if the button is down
    ; bit INPT4
    ; bmi .skipButton

    ; ;change to gameplay mode
    ; lda #2
    ; sta gameMode

    ; ;Start the music
    ; BANK_SWITCH 4,StartIntoTheLight

.skipButton

DoneWinScreenHack

    BANK_SWITCH 0,DoneGameplayScreenLogic

    include "InputEngine.asm"
    include "DrawCharacter.asm"
    include "SetHorizPos.asm"
    include "CheckInput.asm"
    include "CharacterMovement.asm"
    include "UpdatePlayerPosition.asm"
    include "ScreenEngine/ScreenDrawData.asm"
    include "ScreenEngine/ScreenDrawEngine.asm"

    include "ScreenEngine/ScreenEngine.asm"
    include "ScreenEngine/ScreenLogicData.asm"
    include "ScreenEngine/ScreenLogicEngine.asm"

    include "SetCorrectAnimation.asm"
    include "SetPlayerAnimation.asm"
    include "SetCreepAnimation.asm"
    include "SetWatcherAnimation.asm"

    include "SetPlayerState.asm"
    include "SetCorrectHorizPos.asm"
    include "CheckIfHiding.asm"
    include "WhichCharacter.asm"