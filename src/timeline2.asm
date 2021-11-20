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
    jsr tt_reset
    jsr tt_render_title

    //set up background sprites for player
    /*
    Set up background sprites for player
    0-2 are used for now playing bg
    3-4 is used for the selection highlight
    */

    //pointers
    lda #$29
    sta $07f8
    sta $07f9
    sta $07fa
    lda #$28
    sta $07fb
    sta $07fc
    //y locations
    lda #$c2
    sta $d001
    sta $d003
    sta $d005
    lda #$00 //to be fixed by menu controller
    sta $d007
    sta $d009
    //x locations
    lda #$a8
    sta $d000
    lda #$d8
    sta $d002
    lda #$f8
    sta $d004
    lda #$28
    sta $d006
    lda #$50
    sta $d008
    //for now, reset to a single color
    ldaStaMany($01,$d027,$08,$01) //fg color
    lda #$00
    sta $d010
    sta $d01c
    lda #$1f
    sta $d01b
    sta $d015
    lda #$07
    sta $d017
    lda #$1f
    sta $d01d

!:
    jsr poll_for_song_change
    jmp!-


poll_for_song_change:
    lda menu_next_song_ready_flag
    bne !+
    rts
!:
    jsr menu_modal
    ldx menu_next_song_filename_a
    ldy menu_next_song_filename_b
    lda #$c0
    sta ll_zp1_hi
    lda #$00
    sta ll_zp1_lo
    jsr loader_load

    lda ll_zp1_hi
    cmp #$c0
    bne !+
    lda ll_zp1_lo
    cmp #$00
    bne !+
    //load did not work... try asking to flip the disk! nn.prg
    jsr blit_save
    petscii_load_sequence('N','N')
    petscii_render_frame(nn, 0, true, 224, 0)
!loop:
    lda m_modal_ack
    beq !loop-
    jsr blit_load
    jmp !-
!:
    lda #$00
    sta enable_music
    jsr m_disable
    jsr exo_exo
    jsr m_reset
    jsr tt_reset
    jsr tt_render_title
    lda #$01
    sta enable_music
    lda #$00
    sta menu_next_song_ready_flag
    jsr menu_no_modal
    rts

.import source "blit.asm"
