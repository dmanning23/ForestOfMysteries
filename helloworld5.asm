
    processor 6502
    include "vcs.h"
    include "macro.h"
    include "xmacro.h"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Constants segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Variables segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    seg.u Variables
    org $80

    ; pointer used to draw the background
backgroundPtr0 .word
backgroundPtr1 .word
backgroundPtr2 .word
backgroundPtr3 .word
backgroundPtr4 .word
backgroundPtr5 .word

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    seg Code
    org $f000

Start
    CLEAN_START

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Startup code
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NextFrame

    ; 1 + 3 lines of VSYNC
    VERTICAL_SYNC

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 35 lines of underscan
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    TIMER_SETUP 35

    lda #192
    sta COLUPF

    lda #<wowMuchHelloBitmap0        ; load low byte of Frame0 address
    sta backgroundPtr0
    lda #>wowMuchHelloBitmap0        ; load high byte of Frame0 address
    sta backgroundPtr0+1

    lda #<wowMuchHelloBitmap1        ; load low byte of Frame0 address
    sta backgroundPtr1
    lda #>wowMuchHelloBitmap1        ; load high byte of Frame0 address
    sta backgroundPtr1+1

    lda #<wowMuchHelloBitmap2        ; load low byte of Frame0 address
    sta backgroundPtr2
    lda #>wowMuchHelloBitmap2        ; load high byte of Frame0 address
    sta backgroundPtr2+1

    lda #<wowMuchHelloBitmap3        ; load low byte of Frame0 address
    sta backgroundPtr3
    lda #>wowMuchHelloBitmap3        ; load high byte of Frame0 address
    sta backgroundPtr3+1

    lda #<wowMuchHelloBitmap4        ; load low byte of Frame0 address
    sta backgroundPtr4
    lda #>wowMuchHelloBitmap4        ; load high byte of Frame0 address
    sta backgroundPtr4+1

    lda #<wowMuchHelloBitmap5        ; load low byte of Frame0 address
    sta backgroundPtr5
    lda #>wowMuchHelloBitmap5        ; load high byte of Frame0 address
    sta backgroundPtr5+1

    TIMER_WAIT

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 192 lines of frame
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LinesOfFrame

    ldy #192
    ldx #192

LVScan
    sta WSYNC
    lda (backgroundPtr0),Y
    sta PF0
    lda (backgroundPtr1),Y
    sta PF1
    lda (backgroundPtr2),Y
    sta PF2
    ; nop
    ;nop
    nop
    lda (backgroundPtr3),Y
    sta PF0
    lda (backgroundPtr4),Y
    sta PF1
    lda (backgroundPtr5),Y
    sta PF2

    dex
    txa
    and #$03
    bne notDivisible_by_4
    
    dey

notDivisible_by_4
    cpx #0 ;sets the Z flag based on X
    bne LVScan

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 29 lines of overscan
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

OverScan
    TIMER_SETUP 29
    TIMER_WAIT

    ; total = 262 lines, go to next frame
    jmp NextFrame

    include "Assets/Graphics/wowMuchHelloData.asm"

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Epilogue
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    org $fffc
    .word Start ;reset vector
    .word Start ;BRK vector