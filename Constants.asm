;Screen edges, adjust to match your game
SCREEN_LEFT_EDGE equ #3
SCREEN_TOP_EDGE equ #180 ;#$B9
SCREEN_RIGHT_EDGE equ #159 ;#$9F
SCREEN_BOTTOM_EDGE equ #2

;The input flags are as follows:
CONTROLLER_DOWN     equ #%00000001
CONTROLLER_UP       equ #%00000010
CONTROLLER_LEFT     equ #%00000100
CONTROLLER_RIGHT    equ #%00001000
CONTROLLER_BUTTON   equ #%00010000

;SPRITE_HEIGHT equ #9 ; single size sprite
SPRITE_HEIGHT equ #9*2 ; double size pixel

TITLE_SCREEN equ #0
GAMEPLAY_SCREEN equ #1
WIN_SCREEN equ #2