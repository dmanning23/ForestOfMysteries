;This is a screen engine of a grid of 32 screens
;They are arranged in 4 rows of 8 columns
;There is no world-wraparound (going left off row 0 will not wrap to row 3)

;Add these in your Variables section

; ;The row/column coordinates of the current screen
;screenRow .byte  ; 0-3
;screenCol .byte  ; 0-7
;TempWord .word

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Call this in the game loop part of your game to perform the screen logic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PerformScreenLogic
    lda screenRow
    asl
    asl
    asl             ; multiply by 8 (columns per row)
    clc
    adc screenCol   ; add column offset
    tax
    
    lda ScreenJumpTableLo,x
    sta TempWord
    lda ScreenJumpTableHi,x
    sta TempWord+1
    jmp (TempWord)
EndScreenLogic
    rts

; Jump tables (64 entries)

ScreenJumpTableLo
    .byte <Screen00, <Screen01, <Screen02, <Screen03
    .byte <Screen04, <Screen05, <Screen06, <Screen07
    .byte <Screen10, <Screen11, <Screen12, <Screen13
    .byte <Screen14, <Screen15, <Screen16, <Screen17
    .byte <Screen20, <Screen21, <Screen22, <Screen23
    .byte <Screen24, <Screen25, <Screen26, <Screen27
    .byte <Screen30, <Screen31, <Screen32, <Screen33
    .byte <Screen34, <Screen35, <Screen36, <Screen37
    .byte <Screen40, <Screen41, <Screen42, <Screen43
    .byte <Screen44, <Screen45, <Screen46, <Screen47
    .byte <Screen50, <Screen51, <Screen52, <Screen53
    .byte <Screen54, <Screen55, <Screen56, <Screen57
    .byte <Screen60, <Screen61, <Screen62, <Screen63
    .byte <Screen64, <Screen65, <Screen66, <Screen67
    .byte <Screen70, <Screen71, <Screen72, <Screen73
    .byte <Screen74, <Screen75, <Screen76, <Screen77

ScreenJumpTableHi
    .byte >Screen00, >Screen01, >Screen02, >Screen03
    .byte >Screen04, >Screen05, >Screen06, >Screen07
    .byte >Screen10, >Screen11, >Screen12, >Screen13
    .byte >Screen14, >Screen15, >Screen16, >Screen17
    .byte >Screen20, >Screen21, >Screen22, >Screen23
    .byte >Screen24, >Screen25, >Screen26, >Screen27
    .byte >Screen30, >Screen31, >Screen32, >Screen33
    .byte >Screen34, >Screen35, >Screen36, >Screen37
    .byte >Screen40, >Screen41, >Screen42, >Screen43
    .byte >Screen44, >Screen45, >Screen46, >Screen47
    .byte >Screen50, >Screen51, >Screen52, >Screen53
    .byte >Screen54, >Screen55, >Screen56, >Screen57
    .byte >Screen60, >Screen61, >Screen62, >Screen63
    .byte >Screen64, >Screen65, >Screen66, >Screen67
    .byte >Screen70, >Screen71, >Screen72, >Screen73
    .byte >Screen74, >Screen75, >Screen76, >Screen77
