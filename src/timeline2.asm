    //player bg

    load('0','0',$c000) 
    jsr exo_exo
    jsr m_reset
    load('I','I',$c000)
    jsr exo_exo

    lda #$06
    sta $d021
    petscii_render_frame(ii, 1, false, $00, $00)

    //enable main irq effect
    lda #$01
    sta enable_effect
    sta enable_music
!:
    jmp!-