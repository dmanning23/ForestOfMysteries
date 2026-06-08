
    processor 6502
    include "vcs.h"
    include "macro.h"
    include "xmacro.h"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Constants segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    include "Constants.asm"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Variables segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    seg.u Variables
    org $80

    include "Variables.asm"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Macro that implements Bank Switching trampoline
; X = bank number
; A = hi byte of destination PC
; Y = lo byte of destination PC
    MAC BANK_SWITCH_TRAMPOLINE
        pha             ; push hi byte
        tya             ; Y -> A
        pha             ; push lo byte
        lda $1FF4,x     ; do the bank switch <--- VERY IMPORTANT for 16k games! To do a 32k game, map to 1FF4
        rts             ; return to target
    ENDM

; Macro that performs bank switch
    MAC BANK_SWITCH
.Bank   SET {1}
.Addr   SET {2}
        lda #>(.Addr-1)
        ldy #<(.Addr-1)
        ldx #.Bank
        jmp BankSwitch
    ENDM

; Bank prologue that handles reset
; no matter which bank is selected at powerup
; it switches to bank 0 and jumps to Reset_0
    MAC BANK_PROLOGUE
        lda #>(Reset_0-1)
        ldy #<(Reset_0-1)
        ldx #$ff
        txs		; set up stack pointer
        inx		; X = 0
    ENDM

; Bank epilogue -- 6502 vectors
    MAC BANK_VECTORS
        .word Start      ; NMI
        .word Start      ; RESET
        .word Start	 ; BRK
    ENDM

    seg Code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BANK 0: Scaffolding to run game

    org  $1000
    rorg $F000
;----The following code is the same on both banks----
Start
    BANK_PROLOGUE
BankSwitch
    BANK_SWITCH_TRAMPOLINE
;----End of bank-identical code----

Reset_0

    CLEAN_START

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Startup code
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    lda #0
    sta MUS_FRAME
    sta MUS_STEP
    sta MUS_PAT_IDX
    sta MUS_PLAYING
    sta MUS_ARR_OFF
    sta MUS_PTR

    sta SFX_LEFT
    sta SFX_RIGHT
    sta SFX_LEFT_TIMER
    sta SFX_RIGHT_TIMER

    ;start on the title screen
    lda #0
    sta gameMode

NextFrame

    ; 1 + 3 lines of VSYNC
    VERTICAL_SYNC

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 35 lines of underscan
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    TIMER_SETUP 34 ;leave one extra line for the logic to jump to draw routines

    ;clear the registers
    lda #0
    sta GRP0
    sta COLUP0
    sta COLUBK
    sta COLUPF

    ;are we on the title screen?
    lda gameMode
    cmp #TITLE_SCREEN
    bne CheckGameplayScreenLogic

    ;Title Screen
    BANK_SWITCH 1,TitleScreenLogic

DoneTitleScreenLogic
    jmp DoneCheckingScreenLogic

CheckGameplayScreenLogic

    lda gameMode
    cmp #GAMEPLAY_SCREEN
    bne CheckNextScreenLogicTODO

    ;Gameplay Screen
    BANK_SWITCH 2,GameplayScreenLogic

DoneGameplayScreenLogic
    jmp DoneCheckingScreenLogic

CheckNextScreenLogicTODO

DoneCheckingScreenLogic

    TIMER_WAIT

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 192 lines of frame
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;are we on the title screen?
    lda gameMode
    cmp #TITLE_SCREEN
    bne CheckGameplayScreenDraw

    ;Title Screen
    BANK_SWITCH 1,TitleScreenDraw

DoneTitleScreenDraw
    jmp DoneCheckingScreenDraw

CheckGameplayScreenDraw

    lda gameMode
    cmp #GAMEPLAY_SCREEN
    bne CheckNextScreenDrawTODO

    ;Gameplay Screen
    BANK_SWITCH 2,PerformScreenDraw

DoneGameplayScreenDraw
    jmp DoneCheckingScreenDraw

CheckNextScreenDrawTODO

DoneCheckingScreenDraw

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 29 lines of overscan
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

OverScan
    TIMER_SETUP 29

    ;clear the registers
    lda #0
    sta GRP0
    sta COLUP0
    sta COLUBK
    sta COLUPF
    sta PF0
    sta PF1
    sta PF2

    TIMER_WAIT

    ; total = 262 lines, go to next frame
    jmp NextFrame

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Bank 0 epilogue
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org  $1FFA
    rorg $FFFA
    BANK_VECTORS



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BANK 1: Title Screen

    org  $2000
    rorg $F000
;----The following code is the same on both banks----
Start
    BANK_PROLOGUE
BankSwitch
    BANK_SWITCH_TRAMPOLINE
;----End of bank-identical code----

    include "TitleScreen.asm"

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Bank 1 epilogue
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org  $2FFA
    rorg $FFFA
    BANK_VECTORS



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BANK 2 Gameplay Screen Logic

    org  $3000
    rorg $F000
;----The following code is the same on both banks----
Start
    BANK_PROLOGUE
BankSwitch
    BANK_SWITCH_TRAMPOLINE
;----End of bank-identical code----

    include "GameplayScreen.asm"

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Bank 2 epilogue
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org  $3FFA
    rorg $FFFA
    BANK_VECTORS



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BANK 3 Gameplay Screen Drawing

    org  $4000
    rorg $F000
;----The following code is the same on both banks----
Start
    BANK_PROLOGUE
BankSwitch
    BANK_SWITCH_TRAMPOLINE
;----End of bank-identical code----

    include "ScreenEngine/ScreenDrawSubroutines123.asm"

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Bank 3 epilogue
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org  $4FFA
    rorg $FFFA
    BANK_VECTORS



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BANK 4 Gameplay Music

    org  $5000
    rorg $F000
;----The following code is the same on both banks----
Start
    BANK_PROLOGUE
BankSwitch
    BANK_SWITCH_TRAMPOLINE
;----End of bank-identical code----

StartWhisperingTrees subroutine

    jsr MUSIC_INIT_WHISPERING_TREES
    BANK_SWITCH 1,DoneResetGameplay

UpdateWhisperingTrees subroutine
    jsr MUSIC_UPDATE
    BANK_SWITCH 2,DoneUpdateGameplayScreenLogic

    include "Sound/MusicEngine.asm"
    include "Sound/Whispering_trees-music.asm"

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Bank 4 epilogue
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org  $5FFA
    rorg $FFFA
    BANK_VECTORS



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BANK 5

    org  $6000
    rorg $F000
;----The following code is the same on both banks----
Start
    BANK_PROLOGUE
BankSwitch
    BANK_SWITCH_TRAMPOLINE
;----End of bank-identical code----

    ;include "ScreenEngine/ScreenDrawSubroutines789.asm"

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Bank 5 epilogue
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org  $6FFA
    rorg $FFFA
    BANK_VECTORS



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BANK 6

    org  $7000
    rorg $F000
;----The following code is the same on both banks----
Start
    BANK_PROLOGUE
BankSwitch
    BANK_SWITCH_TRAMPOLINE
;----End of bank-identical code----

    ;include "ScreenEngine/ScreenDrawSubroutines101112.asm"

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Bank 6 epilogue
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org  $7FFA
    rorg $FFFA
    BANK_VECTORS



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; BANK 7

    org  $8000
    rorg $F000
;----The following code is the same on both banks----
Start
    BANK_PROLOGUE
BankSwitch
    BANK_SWITCH_TRAMPOLINE
;----End of bank-identical code----

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Bank 7 epilogue
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org  $8FFA
    rorg $FFFA
    BANK_VECTORS
