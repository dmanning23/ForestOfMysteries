;Screen edges, adjust to match your game
SCREEN_LEFT_EDGE equ #3
SCREEN_TOP_EDGE equ #180 ;#$B9
SCREEN_RIGHT_EDGE equ #159 ;#$9F
SCREEN_BOTTOM_EDGE equ #2

;The input flags are as follows:
CONTROLLER_BUTTON equ #%00000001
CONTROLLER_UP     equ #%00000010
CONTROLLER_LEFT   equ #%00000100
CONTROLLER_RIGHT  equ #%00001000
CONTROLLER_DOWN   equ #%00010000

;PLAYER_SPRITE_HEIGHT equ #9 ; single size sprite
PLAYER_SPRITE_HEIGHT equ #9*2 ; double size pixel
CREEP_SPRITE_HEIGHT equ #16*2 ; double size pixel

;These are the game states used to decide which screen to show
TITLE_SCREEN equ #0
GAMEPLAY_SCREEN equ #1
WIN_SCREEN equ #2

;These are the various player states.
PLAYER_STANDING equ #0
PLAYER_CROUCHING equ #1
PLAYER_WALKING equ #2
PLAYER_SNEAKING equ #3
PLAYER_STAND_HIDING equ #4
PLAYER_CROUCH_HIDING equ #5
PLAYER_WALK_HIDING equ #6
PLAYER_SNEAK_HIDING equ #7
