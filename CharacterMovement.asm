;These go in your Constants section

; ;Screen edges, adjust to match your game
; SCREEN_LEFT_EDGE equ #0
; SCREEN_TOP_EDGE equ #185 ;#$B9
; SCREEN_RIGHT_EDGE equ #159 ;#$9F
; SCREEN_BOTTOM_EDGE equ #0


; ;These are in the variables section
;playerXPos .byte
;playerYPos .byte
;playerXVel .byte
;playerYVel .byte

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Add the X velocity to the player's X position
; Y = player number (0 for p1, 1 for p2)
; Return: A will be 0 if the player went off screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UpdateCharacterX subroutine

    ;Only update the characters position every fourth frame
    lda frameCounter
    lsr
    lsr
    bcs .odd    ; carry set = bit 0 was 1 = odd

    ; Arithmetic shift right on signed playerYVel
    lda playerXVel,y
    cmp #$80        ; sets carry if negative (bit 7 set)
    ror             ; shift right, carry goes into bit 7
    
    clc ; Clear carry before addition
    adc playerXPos,y
    sta playerXPos,y

.odd

    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Add the Y velocity to the player's Y position
; Y = player number (0 for p1, 1 for p2)
; Return: A will be 0 if the player went off screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UpdateCharacterY subroutine

    lda frameCounter
    lsr
    bcs .odd

    lda playerYVel,y
    cmp #$80
    ror
    
    clc
    adc playerYPos,y
    sta playerYPos,y

.odd

    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set the player position to the left edge
; Y = player number (0 for p1, 1 for p2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetPlayerPosLeftEdge
    lda #SCREEN_LEFT_EDGE+1
    clc
    adc #1
    sta playerXPos,y
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set the player position to the right edge
; Y = player number (0 for p1, 1 for p2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetPlayerPosRightEdge
    lda #SCREEN_RIGHT_EDGE-1
    sec
    sbc #1
    sta playerXPos,y
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set the player position to the ceiling
; Y = player number (0 for p1, 1 for p2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetPlayerPosCeiling
    lda #SCREEN_TOP_EDGE-1
    sec
    sbc #1
    sta playerYPos,y
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set the player position to the floor
; Y = player number (0 for p1, 1 for p2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetPlayerPosFloor
    lda #SCREEN_BOTTOM_EDGE+1
    clc
    adc #1
    sta playerYPos,y
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Center the player horizontally
; Y = player number (0 for p1, 1 for p2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CenterPlayerX
    lda #SCREEN_RIGHT_EDGE
    lsr ;divide by 2
    sta playerXPos,y
    rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Center the player vertically
; Y = player number (0 for p1, 1 for p2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CenterPlayerY
    lda #SCREEN_TOP_EDGE
    lsr ;divide by 2
    sta playerYPos,y
    rts