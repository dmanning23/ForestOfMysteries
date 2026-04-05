;The screen coordinates of the player
playerXPos .byte
playerYPos .byte

playerPrevXPos .byte
playerPrevYPos .byte

;The velocity of the player
playerXVel .byte
playerYVel .byte

;The row/column coordinates of the current screen
screenRow .byte  ; 0-3
screenCol .byte  ; 0-7
TempWord .word

;The player's input from the previous frame
p1PrevInput byte
p2PrevInput byte

;The player's input from the current frame
p1Input byte
p2Input byte

;This variable is used to mask the controller input to map to p1 or p2
controllerMask .byte 

; Pointer used to draw the character
spritePtr .word
spriteColorPtr .word

; pointer used to draw the background
backgroundPtr0 .word
backgroundPtr1 .word
backgroundPtr2 .word
backgroundPtr3 .word
backgroundPtr4 .word
backgroundPtr5 .word

;variable used to tell which game mode it is
;0: title screen
;1: gameplay
gameMode .byte

temp byte

MUS_FRAME .byte;    - frame countdown (1 byte)
MUS_STEP .byte;     - step within pattern (1 byte)
MUS_PAT_IDX .byte;  - arrangement index (1 byte)
MUS_PLAYING .byte;  - 0=stopped, 1=playing (1 byte)
MUS_ARR_OFF .byte;  - saved arrangement byte offset (1 byte)
MUS_PTR .word;      - temp zero-page pointer (2 bytes)
MUS_ARR_PTR .word;  - pointer to current song's arrangement table (2 bytes)
MUS_TEMPO .byte;    - frames per step for current song (1 byte)
MUS_NUM_PATS .byte; - number of patterns in current song (1 byte)

SFX_LEFT .byte
SFX_RIGHT .byte
SFX_LEFT_TIMER .byte
SFX_RIGHT_TIMER .byte