
DrawCorrectScreen subroutine

    ;is the creep on this screen?
    lda creepScreenRow
    cmp screenRow
    bne .noCreepOnScreen

    lda creepScreenCol
    cmp screenCol
    bne .noCreepOnScreen

    ;The creep is on this screen

    ;Is this an even or odd frame?
    lda frameCounter
    lsr
    bcs .noCreepOnScreen    ; carry set = bit 0 was 1 = odd

    jsr DrawScreenWithCreep
    jmp .done

.noCreepOnScreen

    ;Only need to draw the player
    jsr DrawScreenWithPlayer

.done

    BANK_SWITCH 0,DoneGameplayScreenDraw



;Draw the screen with just the player
DrawScreenWithPlayer subroutine

    ldy #48
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda (backgroundPtr0),Y
    sta PF0
    lda (backgroundPtr1),Y
    sta PF1
    lda (backgroundPtr2),Y
    sta PF2

    ; odd lines: draw the player sprite (inlined - no JSR/RTS overhead)
    sty temp
    
    txa                     ; X = current scanline
    sec
    sbc playerYPos1          ; local coordinate
    cmp #PLAYER_SPRITE_HEIGHT      ; in sprite?
    bcc .InSprite           ; yes
    lda #0                  ; no, use row 0 (transparent)
.InSprite

    lsr
    tay                     ; sprite row -> Y

    sta WSYNC

    lda (playerSpritePtr),y       ; lookup sprite pattern
    sta GRP0                ; write sprite bitmap
    lda (playerSpriteColorPtr),y  ; lookup sprite color
    sta COLUP0              ; write color

    lda #0
    sta PF0
    sta PF1
    sta PF2

    ldy temp               ; restore bitmap row index

    dex
    dex
    txa
    and #$03
    bne .notDivisible_by_4

    dey

.notDivisible_by_4

    cpx #0 ;sets the Z flag based on X
    bne .lvscan

    ldy #0  ; restore Y so ScreenWraparoundAll/CheckInput index player 0 correctly

    rts



;This reoutine draws both the player and the Purple Creep
DrawScreenWithCreep subroutine

    ldy #48
    ldx #192

.lvscan

    ; even lines: draw the bitmap background
    sta WSYNC
    lda (backgroundPtr0),Y
    sta PF0
    lda (backgroundPtr1),Y
    sta PF1
    lda (backgroundPtr2),Y
    sta PF2

    ; odd lines: draw the player sprites
    sty temp
    
    ;Draw the purple creep
    txa
    sec
    sbc playerYPos2
    cmp #CREEP_SPRITE_HEIGHT
    bcc .InCreepSprite
    lda #0
.InCreepSprite

    lsr
    tay

    sta WSYNC

    lda (creepSpritePtr),y
    sta GRP1
    lda (creepSpriteColorPtr),y
    sta COLUP1

    lda #0
    sta PF0
    sta PF1
    sta PF2

    ldy temp

    dex
    dex
    txa
    and #$03
    bne .notDivisible_by_4

    dey

.notDivisible_by_4

    cpx #0
    bne .lvscan

    ldy #0

    rts




    include "Assets/Graphics/Backgrounds/FoM_4Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_5Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_8Data.asm"
    include "Assets/Graphics/Backgrounds/FoM_12Data.asm"
    include "Assets/Graphics/Playfields/test.asm"
    include "Assets/Graphics/player_sprite.asm"
    include "Assets/Graphics/PurpleCreep_sprite.asm"
    include "Assets/Graphics/HellWatcher_sprite.asm"