    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; SetHorizPos routine
    ; A = X coordinate of the object
    ; X = index of the desired object:
    ;  0: player 1
    ;  1: player 2
    ;  2: missile 1
    ;  3: missile 2
    ;  4: ball
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetHorizPos subroutine
    sta WSYNC ; start a new line
    sec ; set carry flag
.DivideLoop
    sbc #15 ; subtract 15
    bcs .DivideLoop ; branch until negative
    eor #7 ; calculate fine offset
    asl
    asl
    asl
    asl
    sta RESP0,x ; fix coarse position
    sta HMP0,x ; set fine offset
    rts ; return to caller

    ; ;After done calling SetHorizPos in the update loop for all your objects,
    ; ;make sure to call the following bit of code to sync everything
    ; ;Otherwise the fine offset will not be set and your objects will appear to jump
    ; sta WSYNC	; sync w/ scanline
    ; sta HMOVE	; apply fine offsets