Screen00
    jsr UpdatePlayerPosition

    ;TODO: check for left wall
    ;TODO: check for ceiling

    lda #<FoM_1Bitmap0        ; load low byte of Frame0 address
    sta backgroundPtr0
    lda #>FoM_1Bitmap0        ; load high byte of Frame0 address
    sta backgroundPtr0+1

    lda #<FoM_1Bitmap1        ; load low byte of Frame0 address
    sta backgroundPtr1
    lda #>FoM_1Bitmap1        ; load high byte of Frame0 address
    sta backgroundPtr1+1

    lda #<FoM_1Bitmap2        ; load low byte of Frame0 address
    sta backgroundPtr2
    lda #>FoM_1Bitmap2        ; load high byte of Frame0 address
    sta backgroundPtr2+1

    lda #<FoM_1Bitmap3        ; load low byte of Frame0 address
    sta backgroundPtr3
    lda #>FoM_1Bitmap3        ; load high byte of Frame0 address
    sta backgroundPtr3+1

    lda #<FoM_1Bitmap4        ; load low byte of Frame0 address
    sta backgroundPtr4
    lda #>FoM_1Bitmap4        ; load high byte of Frame0 address
    sta backgroundPtr4+1

    lda #<FoM_1Bitmap5        ; load low byte of Frame0 address
    sta backgroundPtr5
    lda #>FoM_1Bitmap5        ; load high byte of Frame0 address
    sta backgroundPtr5+1

    jsr ScreenWraparound

    jmp EndScreenLogic

Screen01
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen02
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen03
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen04
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen05
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen06
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen07
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen10
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen11
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen12
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen13
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen14
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen15
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen16
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen17
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen20
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen21
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen22
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen23
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen24
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen25
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen26
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen27
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen30
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen31
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen32
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen33
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen34
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen35
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen36
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen37
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen40 subroutine
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen41
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen42
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen43
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen44
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen45
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen46
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen47
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen50
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen51
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen52
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen53
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen54
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen55
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen56
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen57
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen60
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen61
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen62
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen63
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen64
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen65
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen66
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen67
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen70
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen71
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen72
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen73
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen74
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen75
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen76
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic

Screen77
    jsr UpdatePlayerPosition
    jsr ScreenWraparound
    
    jmp EndScreenLogic
