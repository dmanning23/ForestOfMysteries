;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PLAYER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;The screen coordinates of the player
playerXPos1 .byte
playerYPos1 .byte

playerPrevXPos .byte
playerPrevYPos .byte

;The velocity of the player
playerXVel .byte
playerYVel .byte

;The row/column coordinates of the current screen
screenRow .byte  ; 0-3
screenCol .byte  ; 0-7
TempWord .word

;The player's current state. Enumerated in the PLAYER_ constants
playerState1 .byte

;The player's input from the previous frame
playerPrevInput1 .byte

;The player's input from the current frame
playerInput1 .byte

;Whether or not the player is hiding
playerHiding .byte

playerFlipped .byte

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PURPLE CREEP VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;The row/column coordinates of the purple creep
creepScreenRow .byte  ; 0-3
creepScreenCol .byte  ; 0-7

creepXPos .byte
creepYPos .byte

creepFlipped .byte

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; HELL WATCHER VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Row/Column of the hell watcher
watcherScreenRow .byte
watcherScreenCol .byte

watcherXPos .byte
watcherYPos .byte

watcherFlipped .byte

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVERYTHING ELSE VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; The current character that is being drawn
; 0: player
; 1: Purple Creep
; 2: Hell Watcher
currentCharacter .byte

;This variable is used to mask the controller input to map to p1 or p2
controllerMask .byte 

; Pointers used to draw the characters
spritePtr .word
spriteColorPtr .word

; pointer used to draw the background
backgroundPtr0 .word
backgroundPtr1 .word
backgroundPtr2 .word

;variable used to tell which game mode it is
;0: title screen
;1: gameplay
gameMode .byte

;Variable used to time the frames. Counts up +1 every frame
frameCounter .byte

temp .byte

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