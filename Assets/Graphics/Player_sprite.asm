;Player Sprite Data (Height: 9, Mode: normal)

;Standing Animation Data:
PlayerStanding1
  .byte %00000000 ; Row 1
  .byte %01000100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %01111000 ; Row 4
  .byte %00111000 ; Row 5
  .byte %00111100 ; Row 6
  .byte %00111000 ; Row 7
  .byte %00111100 ; Row 8
  .byte %01100000 ; Row 9

PlayerStandingColor1
  .byte $0E ; Row 1
  .byte $F8 ; Row 2
  .byte $94 ; Row 3
  .byte $96 ; Row 4
  .byte $98 ; Row 5
  .byte $0C ; Row 6
  .byte $0E ; Row 7
  .byte $98 ; Row 8
  .byte $0E ; Row 9

PlayerStandingSpeed:
  .byte 30 ; Animation speed

PlayerStandingFrames:
  .byte 1 ; Number of frames

;Standing_Hiding Animation Data:
PlayerStand_Hiding1
  .byte %00000000 ; Row 1
  .byte %01000100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %01111000 ; Row 4
  .byte %00111000 ; Row 5
  .byte %00111100 ; Row 6
  .byte %00101000 ; Row 7
  .byte %00111100 ; Row 8
  .byte %01100000 ; Row 9

PlayerStand_HidingColor1
  .byte $0E ; Row 1
  .byte $06 ; Row 2
  .byte $06 ; Row 3
  .byte $06 ; Row 4
  .byte $06 ; Row 5
  .byte $06 ; Row 6
  .byte $0E ; Row 7
  .byte $06 ; Row 8
  .byte $06 ; Row 9

PlayerStand_HidingSpeed:
  .byte 30 ; Animation speed

PlayerStand_HidingFrames:
  .byte 1 ; Number of frames

;Crouching Animation Data:
PlayerCrouching1
  .byte %00000000 ; Row 1
  .byte %01000100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111100 ; Row 4
  .byte %00011110 ; Row 5
  .byte %00011100 ; Row 6
  .byte %00011110 ; Row 7
  .byte %00110000 ; Row 8
  .byte %00000000 ; Row 9

PlayerCrouchingColor1
  .byte $0E ; Row 1
  .byte $F8 ; Row 2
  .byte $94 ; Row 3
  .byte $98 ; Row 4
  .byte $0C ; Row 5
  .byte $0E ; Row 6
  .byte $98 ; Row 7
  .byte $0E ; Row 8
  .byte $0E ; Row 9

PlayerCrouchingSpeed:
  .byte 30 ; Animation speed

PlayerCrouchingFrames:
  .byte 1 ; Number of frames

;Crouch_Hiding Animation Data:
PlayerCrouch_Hiding1
  .byte %00000000 ; Row 1
  .byte %01000100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111100 ; Row 4
  .byte %00011110 ; Row 5
  .byte %00010100 ; Row 6
  .byte %00011110 ; Row 7
  .byte %00110000 ; Row 8
  .byte %00000000 ; Row 9

PlayerCrouch_HidingColor1
  .byte $0E ; Row 1
  .byte $06 ; Row 2
  .byte $06 ; Row 3
  .byte $06 ; Row 4
  .byte $06 ; Row 5
  .byte $0E ; Row 6
  .byte $06 ; Row 7
  .byte $06 ; Row 8
  .byte $0E ; Row 9

PlayerCrouch_HidingSpeed:
  .byte 30 ; Animation speed

PlayerCrouch_HidingFrames:
  .byte 1 ; Number of frames

;Walking Animation Data:
PlayerWalking1
  .byte %00000000 ; Row 1
  .byte %01100100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %01111000 ; Row 4
  .byte %00111000 ; Row 5
  .byte %00111100 ; Row 6
  .byte %00111000 ; Row 7
  .byte %00111100 ; Row 8
  .byte %01100000 ; Row 9

PlayerWalkingColor1
  .byte $0E ; Row 1
  .byte $F8 ; Row 2
  .byte $94 ; Row 3
  .byte $96 ; Row 4
  .byte $98 ; Row 5
  .byte $0C ; Row 6
  .byte $0E ; Row 7
  .byte $98 ; Row 8
  .byte $0E ; Row 9

PlayerWalking2
  .byte %00000000 ; Row 1
  .byte %00100100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %01111000 ; Row 4
  .byte %00111000 ; Row 5
  .byte %00111100 ; Row 6
  .byte %00111000 ; Row 7
  .byte %00111100 ; Row 8
  .byte %01100000 ; Row 9

PlayerWalkingColor2
  .byte $0E ; Row 1
  .byte $F8 ; Row 2
  .byte $94 ; Row 3
  .byte $96 ; Row 4
  .byte $98 ; Row 5
  .byte $0C ; Row 6
  .byte $0E ; Row 7
  .byte $98 ; Row 8
  .byte $0E ; Row 9

PlayerWalking3
  .byte %00000000 ; Row 1
  .byte %00101100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111100 ; Row 4
  .byte %00111000 ; Row 5
  .byte %00111100 ; Row 6
  .byte %00111000 ; Row 7
  .byte %00111100 ; Row 8
  .byte %01100000 ; Row 9

PlayerWalkingColor3
  .byte $0E ; Row 1
  .byte $F8 ; Row 2
  .byte $94 ; Row 3
  .byte $96 ; Row 4
  .byte $98 ; Row 5
  .byte $0C ; Row 6
  .byte $0E ; Row 7
  .byte $98 ; Row 8
  .byte $0E ; Row 9

PlayerWalking4
  .byte %00000000 ; Row 1
  .byte %01001000 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111100 ; Row 4
  .byte %00111000 ; Row 5
  .byte %00111100 ; Row 6
  .byte %00111000 ; Row 7
  .byte %00111100 ; Row 8
  .byte %01100000 ; Row 9

PlayerWalkingColor4
  .byte $0E ; Row 1
  .byte $F8 ; Row 2
  .byte $94 ; Row 3
  .byte $96 ; Row 4
  .byte $98 ; Row 5
  .byte $0C ; Row 6
  .byte $0E ; Row 7
  .byte $98 ; Row 8
  .byte $0E ; Row 9

PlayerWalkingSpeed:
  .byte 7 ; Animation speed

PlayerWalkingFrames:
  .byte 4 ; Number of frames

;Walk_Hiding Animation Data:
PlayerWalk_Hiding1
  .byte %00000000 ; Row 1
  .byte %01100100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %01111000 ; Row 4
  .byte %00111000 ; Row 5
  .byte %00111100 ; Row 6
  .byte %00101000 ; Row 7
  .byte %00111100 ; Row 8
  .byte %01100000 ; Row 9

PlayerWalk_HidingColor1
  .byte $0E ; Row 1
  .byte $06 ; Row 2
  .byte $06 ; Row 3
  .byte $06 ; Row 4
  .byte $06 ; Row 5
  .byte $06 ; Row 6
  .byte $0E ; Row 7
  .byte $06 ; Row 8
  .byte $06 ; Row 9

PlayerWalk_Hiding2
  .byte %00000000 ; Row 1
  .byte %00100100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %01111000 ; Row 4
  .byte %00111000 ; Row 5
  .byte %00111100 ; Row 6
  .byte %00101000 ; Row 7
  .byte %00111100 ; Row 8
  .byte %01100000 ; Row 9

PlayerWalk_HidingColor2
  .byte $0E ; Row 1
  .byte $06 ; Row 2
  .byte $06 ; Row 3
  .byte $06 ; Row 4
  .byte $06 ; Row 5
  .byte $06 ; Row 6
  .byte $0E ; Row 7
  .byte $06 ; Row 8
  .byte $06 ; Row 9

PlayerWalk_Hiding3
  .byte %00000000 ; Row 1
  .byte %00101100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111100 ; Row 4
  .byte %00111000 ; Row 5
  .byte %00111100 ; Row 6
  .byte %00101000 ; Row 7
  .byte %00111100 ; Row 8
  .byte %01100000 ; Row 9

PlayerWalk_HidingColor3
  .byte $0E ; Row 1
  .byte $06 ; Row 2
  .byte $06 ; Row 3
  .byte $06 ; Row 4
  .byte $06 ; Row 5
  .byte $06 ; Row 6
  .byte $0E ; Row 7
  .byte $06 ; Row 8
  .byte $06 ; Row 9

PlayerWalk_Hiding4
  .byte %00000000 ; Row 1
  .byte %01001000 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111100 ; Row 4
  .byte %00111000 ; Row 5
  .byte %00111100 ; Row 6
  .byte %00101000 ; Row 7
  .byte %00111100 ; Row 8
  .byte %01100000 ; Row 9

PlayerWalk_HidingColor4
  .byte $0E ; Row 1
  .byte $06 ; Row 2
  .byte $06 ; Row 3
  .byte $06 ; Row 4
  .byte $06 ; Row 5
  .byte $06 ; Row 6
  .byte $0E ; Row 7
  .byte $06 ; Row 8
  .byte $06 ; Row 9

PlayerWalk_HidingSpeed:
  .byte 30 ; Animation speed

PlayerWalk_HidingFrames:
  .byte 4 ; Number of frames

;Sneaking Animation Data:
PlayerSneaking1
  .byte %00000000 ; Row 1
  .byte %01100100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111100 ; Row 4
  .byte %00011110 ; Row 5
  .byte %00011100 ; Row 6
  .byte %00011110 ; Row 7
  .byte %00110000 ; Row 8
  .byte %00000000 ; Row 9

PlayerSneakingColor1
  .byte $0E ; Row 1
  .byte $F8 ; Row 2
  .byte $94 ; Row 3
  .byte $98 ; Row 4
  .byte $0C ; Row 5
  .byte $0E ; Row 6
  .byte $98 ; Row 7
  .byte $0E ; Row 8
  .byte $0E ; Row 9

PlayerSneaking2
  .byte %00000000 ; Row 1
  .byte %00100100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111100 ; Row 4
  .byte %00011110 ; Row 5
  .byte %00011100 ; Row 6
  .byte %00011110 ; Row 7
  .byte %00110000 ; Row 8
  .byte %00000000 ; Row 9

PlayerSneakingColor2
  .byte $0E ; Row 1
  .byte $F8 ; Row 2
  .byte $94 ; Row 3
  .byte $98 ; Row 4
  .byte $0C ; Row 5
  .byte $0E ; Row 6
  .byte $98 ; Row 7
  .byte $0E ; Row 8
  .byte $0E ; Row 9

PlayerSneaking3
  .byte %00000000 ; Row 1
  .byte %01001100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111000 ; Row 4
  .byte %00011110 ; Row 5
  .byte %00011100 ; Row 6
  .byte %00011110 ; Row 7
  .byte %00110000 ; Row 8
  .byte %00000000 ; Row 9

PlayerSneakingColor3
  .byte $0E ; Row 1
  .byte $F8 ; Row 2
  .byte $94 ; Row 3
  .byte $98 ; Row 4
  .byte $0C ; Row 5
  .byte $0E ; Row 6
  .byte $98 ; Row 7
  .byte $0E ; Row 8
  .byte $0E ; Row 9

PlayerSneaking4
  .byte %00000000 ; Row 1
  .byte %01001000 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111000 ; Row 4
  .byte %00011110 ; Row 5
  .byte %00011100 ; Row 6
  .byte %00011110 ; Row 7
  .byte %00110000 ; Row 8
  .byte %00000000 ; Row 9

PlayerSneakingColor4
  .byte $0E ; Row 1
  .byte $F8 ; Row 2
  .byte $94 ; Row 3
  .byte $98 ; Row 4
  .byte $0C ; Row 5
  .byte $0E ; Row 6
  .byte $98 ; Row 7
  .byte $0E ; Row 8
  .byte $0E ; Row 9

PlayerSneakingSpeed:
  .byte 12 ; Animation speed

PlayerSneakingFrames:
  .byte 4 ; Number of frames

;Sneak_Hiding Animation Data:
PlayerSneak_Hiding1
  .byte %00000000 ; Row 1
  .byte %01100100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111100 ; Row 4
  .byte %00011110 ; Row 5
  .byte %00010100 ; Row 6
  .byte %00011110 ; Row 7
  .byte %00110000 ; Row 8
  .byte %00000000 ; Row 9

PlayerSneak_HidingColor1
  .byte $0E ; Row 1
  .byte $06 ; Row 2
  .byte $06 ; Row 3
  .byte $06 ; Row 4
  .byte $06 ; Row 5
  .byte $0E ; Row 6
  .byte $06 ; Row 7
  .byte $06 ; Row 8
  .byte $0E ; Row 9

PlayerSneak_Hiding2
  .byte %00000000 ; Row 1
  .byte %00100100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111100 ; Row 4
  .byte %00011110 ; Row 5
  .byte %00010100 ; Row 6
  .byte %00011110 ; Row 7
  .byte %00110000 ; Row 8
  .byte %00000000 ; Row 9

PlayerSneak_HidingColor2
  .byte $0E ; Row 1
  .byte $06 ; Row 2
  .byte $06 ; Row 3
  .byte $06 ; Row 4
  .byte $06 ; Row 5
  .byte $0E ; Row 6
  .byte $06 ; Row 7
  .byte $06 ; Row 8
  .byte $0E ; Row 9

PlayerSneak_Hiding3
  .byte %00000000 ; Row 1
  .byte %01001100 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111000 ; Row 4
  .byte %00011110 ; Row 5
  .byte %00010100 ; Row 6
  .byte %00011110 ; Row 7
  .byte %00110000 ; Row 8
  .byte %00000000 ; Row 9

PlayerSneak_HidingColor3
  .byte $0E ; Row 1
  .byte $06 ; Row 2
  .byte $06 ; Row 3
  .byte $06 ; Row 4
  .byte $06 ; Row 5
  .byte $0E ; Row 6
  .byte $06 ; Row 7
  .byte $06 ; Row 8
  .byte $0E ; Row 9

PlayerSneak_Hiding4
  .byte %00000000 ; Row 1
  .byte %01001000 ; Row 2
  .byte %00111000 ; Row 3
  .byte %00111000 ; Row 4
  .byte %00011110 ; Row 5
  .byte %00010100 ; Row 6
  .byte %00011110 ; Row 7
  .byte %00110000 ; Row 8
  .byte %00000000 ; Row 9

PlayerSneak_HidingColor4
  .byte $0E ; Row 1
  .byte $06 ; Row 2
  .byte $06 ; Row 3
  .byte $06 ; Row 4
  .byte $06 ; Row 5
  .byte $0E ; Row 6
  .byte $06 ; Row 7
  .byte $06 ; Row 8
  .byte $0E ; Row 9

PlayerSneak_HidingSpeed:
  .byte 30 ; Animation speed

PlayerSneak_HidingFrames:
  .byte 4 ; Number of frames

