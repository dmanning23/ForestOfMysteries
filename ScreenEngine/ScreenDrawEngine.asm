;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Call this in the game loop part of your game to draw the screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PerformScreenDraw subroutine

    lda screenRow
    asl
    asl
    asl             ; multiply by 8 (columns per row)
    clc
    adc screenCol   ; add column offset
    tax
    
    lda ScreenDrawJumpTableLo,x
    sta TempWord
    lda ScreenDrawJumpTableHi,x
    sta TempWord+1

    sta WSYNC ;add a line here
    jmp (TempWord)

; Jump tables (64 entries)
ScreenDrawJumpTableLo
    .byte <ScreenDraw00, <ScreenDraw01, <ScreenDraw02, <ScreenDraw03
    .byte <ScreenDraw04, <ScreenDraw05, <ScreenDraw06, <ScreenDraw07
    .byte <ScreenDraw10, <ScreenDraw11, <ScreenDraw12, <ScreenDraw13
    .byte <ScreenDraw14, <ScreenDraw15, <ScreenDraw16, <ScreenDraw17
    .byte <ScreenDraw20, <ScreenDraw21, <ScreenDraw22, <ScreenDraw23
    .byte <ScreenDraw24, <ScreenDraw25, <ScreenDraw26, <ScreenDraw27
    .byte <ScreenDraw30, <ScreenDraw31, <ScreenDraw32, <ScreenDraw33
    .byte <ScreenDraw34, <ScreenDraw35, <ScreenDraw36, <ScreenDraw37
    .byte <ScreenDraw40, <ScreenDraw41, <ScreenDraw42, <ScreenDraw43
    .byte <ScreenDraw44, <ScreenDraw45, <ScreenDraw46, <ScreenDraw47
    .byte <ScreenDraw50, <ScreenDraw51, <ScreenDraw52, <ScreenDraw53
    .byte <ScreenDraw54, <ScreenDraw55, <ScreenDraw56, <ScreenDraw57
    .byte <ScreenDraw60, <ScreenDraw61, <ScreenDraw62, <ScreenDraw63
    .byte <ScreenDraw64, <ScreenDraw65, <ScreenDraw66, <ScreenDraw67
    .byte <ScreenDraw70, <ScreenDraw71, <ScreenDraw72, <ScreenDraw73
    .byte <ScreenDraw74, <ScreenDraw75, <ScreenDraw76, <ScreenDraw77

ScreenDrawJumpTableHi
    .byte >ScreenDraw00, >ScreenDraw01, >ScreenDraw02, >ScreenDraw03
    .byte >ScreenDraw04, >ScreenDraw05, >ScreenDraw06, >ScreenDraw07
    .byte >ScreenDraw10, >ScreenDraw11, >ScreenDraw12, >ScreenDraw13
    .byte >ScreenDraw14, >ScreenDraw15, >ScreenDraw16, >ScreenDraw17
    .byte >ScreenDraw20, >ScreenDraw21, >ScreenDraw22, >ScreenDraw23
    .byte >ScreenDraw24, >ScreenDraw25, >ScreenDraw26, >ScreenDraw27
    .byte >ScreenDraw30, >ScreenDraw31, >ScreenDraw32, >ScreenDraw33
    .byte >ScreenDraw34, >ScreenDraw35, >ScreenDraw36, >ScreenDraw37
    .byte >ScreenDraw40, >ScreenDraw41, >ScreenDraw42, >ScreenDraw43
    .byte >ScreenDraw44, >ScreenDraw45, >ScreenDraw46, >ScreenDraw47
    .byte >ScreenDraw50, >ScreenDraw51, >ScreenDraw52, >ScreenDraw53
    .byte >ScreenDraw54, >ScreenDraw55, >ScreenDraw56, >ScreenDraw57
    .byte >ScreenDraw60, >ScreenDraw61, >ScreenDraw62, >ScreenDraw63
    .byte >ScreenDraw64, >ScreenDraw65, >ScreenDraw66, >ScreenDraw67
    .byte >ScreenDraw70, >ScreenDraw71, >ScreenDraw72, >ScreenDraw73
    .byte >ScreenDraw74, >ScreenDraw75, >ScreenDraw76, >ScreenDraw77
