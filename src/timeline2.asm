    //player bg

    load('0','0',$c000) 
    jsr exo_exo
    jsr m_reset
    load('I','I',$c000)
    jsr exo_exo
    petscii_render_frame(ii, 1, false, $00, $00)

    //enable main irq effect
    lda #$01
    sta enable_effect
    sta enable_music


!:
    jsr poll_for_song_change
    jmp!-


poll_for_song_change:
    lda menu_next_song_ready_flag
    bne !+
    rts
!:
    lda #$00
    sta menu_next_song_ready_flag
    ldx menu_next_song_filename_a
    ldy menu_next_song_filename_b
    lda fhi:  #$c0
    sta ll_zp1_hi
    lda flo:  #$00
    sta ll_zp1_lo
    jsr loader_load
    lda #$00
    sta enable_music
    jsr m_disable
    jsr exo_exo
    jsr m_reset
    lda #$01
    sta enable_music
    rts
