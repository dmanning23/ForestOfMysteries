
; ;Add these to the variables section:
; playerYPos1 .byte
; spritePtr1 .word
; spriteColorPtr1 .word

; ;To store a ROM location in the spritePtr11 pointer:
; lda #<Frame0        ; load low byte of Frame0 address
; sta spritePtr11
; lda #>Frame0        ; load high byte of Frame0 address
; sta spritePtr11+1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This draws the 192 scanlines for the picture with the player sprite
; X = current scanline (assumes you are counting down 192 -> 0)
; Y = player number (0 for p1, 1 for p2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DrawPlayer subroutine

    txa ; X -> A
    sec ; set carry for subtract
    sbc playerYPos1,y ; local coordinate
    cmp #SPRITE_HEIGHT ; in sprite?
    bcc .InSprite ; yes, skip to sprite drawing
    lda #0 ; not in sprite, load 0
.InSprite
    lsr ; Uncomment this line if 2pixel tall sprite, Shift right (divide by 2)
    ;lsr ; Also uncomment this line if 4pixel tall sprite, Shift right again (divide by 4)
    tay ; local coord -> Y

    lda (spritePtr1),y ; lookup sprite pattern
    sta WSYNC
    sta GRP0 ; store bitmap
    lda (spriteColorPtr1),y ; lookup color
    sta COLUP0 ; store color

    ; ;uncomment these lines for double color sprites
    ; lda (spritePtr12),y	; lookup color
    ; sta GRP1	; store bitmap
    ; lda (spriteColorPtr12),y ; lookup color
    ; sta COLUP1	; store color

    rts

    ; ;For double sized sprites:
    ; SPRITE_HEIGHT equ #8*2

    ; sta WSYNC ; uncomment this line for 2pixel tall sprites
    ; sta WSYNC ; also uncomment these lines for 4pixel tall sprites
    ; sta WSYNC

    ; ;When decrementing line for scanline counting:
    ; dex ; uncomment this line for 2pixel tall sprites
    ; dex ; also uncomment these lines for 4pixel tall sprites
    ; dex