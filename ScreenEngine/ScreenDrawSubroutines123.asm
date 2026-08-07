
DrawCorrectScreen subroutine

    ;is the player the current character?
    lda currentCharacter
    cmp #PLAYER
    bne .checkCreep

    ;the player is the current character
    jsr DrawScreenWithPlayer
    jmp .done

.checkCreep

    ;is the creep the current character?
    lda currentCharacter
    cmp #CREEP
    bne .checkWatcher

    ;the creep is the current character
    jsr DrawScreenWithCreep
    jmp .done

.checkWatcher

    ;the creep is the current character
    jsr SetWatcherAnimation

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

    lda (spritePtr),y       ; lookup sprite pattern
    sta GRP0                ; write sprite bitmap
    lda (spriteColorPtr),y  ; lookup sprite color
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



;This routine draws the Purple Creep
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
    sbc creepYPos
    cmp #CREEP_SPRITE_HEIGHT
    bcc .InCreepSprite
    lda #0
.InCreepSprite

    lsr
    tay

    sta WSYNC

    lda (spritePtr),y
    sta GRP0
    lda (spriteColorPtr),y
    sta COLUP0

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



;This routine draws the Hell Watcher
DrawScreenWithWatcher subroutine

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
    
    ;Draw the hell watcher
    txa
    sec
    sbc watcherYPos
    cmp #WATCHER_SPRITE_HEIGHT
    bcc .InWatcherSprite
    lda #0
.InWatcherSprite

    lsr
    tay

    sta WSYNC

    lda (spritePtr),y
    sta GRP0
    lda (spriteColorPtr),y
    sta COLUP0

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