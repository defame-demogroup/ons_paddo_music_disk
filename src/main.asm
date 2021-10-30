/*
Main Demo
*/






/*
steps:
1. show loading text and spinner
2. load intro assets and exo 
3. run intro IRQ and wait for space
4. load player base assets and first song
5. run intro animations 
    -> scroll
    -> tile mover
    -> logo x+y swinger
6. main loop: 
    run animation frames 
    ? load new assets and exo (based on timing - screen updated)
    handle keyboard -> render UI actions -> load new assets and exo (music changes)
    irq: play music, poll keyboard, update player status
*/

/*
    //this is how we load songs!
    load($30,$31,$c000) //00.prg
    jsr m_disable
    jsr exo_exo
    jsr m_reset

    //this is how we load screens
    load(73,73,$c000) //ii.prg
    jsr exo_exo
    jsr upk_disable_transparency
    ldx #<txt_playe
    ldy #>txt_playe
    lda #$04
    jsr upk
    ldx #<col_playe
    ldy #>col_playe
    lda #$d8
    jsr upk

    load(69,69,$c000) //ee.prg 
    jsr exo_exo

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls1
    ldy #>txt_moreskulls1
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls1
    ldy #>col_moreskulls1
    lda #$d8
    jsr upk


anim_start:
    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls1
    ldy #>txt_moreskulls1
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls1
    ldy #>col_moreskulls1
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls2
    ldy #>txt_moreskulls2
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls2
    ldy #>col_moreskulls2
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls3
    ldy #>txt_moreskulls3
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls3
    ldy #>col_moreskulls3
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls4
    ldy #>txt_moreskulls4
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls4
    ldy #>col_moreskulls4
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls5
    ldy #>txt_moreskulls5
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls5
    ldy #>col_moreskulls5
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls6
    ldy #>txt_moreskulls6
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls6
    ldy #>col_moreskulls6
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls7
    ldy #>txt_moreskulls7
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls7
    ldy #>col_moreskulls7
    lda #$d8
    jsr upk

    jmp anim_start
    rts    
*/