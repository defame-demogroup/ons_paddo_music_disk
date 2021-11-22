    //player bg

    load('0','0',$c000) 
    jsr exo_exo
    jsr m_reset
    load('I','I',$c000)
    jsr exo_exo
    petscii_render_frame(ii, 0, false, $00, $00)
    petscii_render_frame(ii, 1, true, 254, 254)

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

    //enable main irq effect
    lda #$01
    sta enable_effect
    sta enable_music
    jsr tt_reset
    jsr tt_render_title

!:
    jsr poll_aa
    jsr poll_for_song_change
    jsr poll_cc
    jsr poll_for_song_change
    jsr poll_ee
    jsr poll_for_song_change
    jsr poll_ll
    jsr poll_for_song_change
    jsr poll_mm
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


open_mm:
petscii_load_sequence('M','M')
animate_open(mm)
rts

close_mm:
animate_close(mm)
rts

run_mm:
animate_part(mm)
rts

poll_mm:
jsr open_mm
lda menu_next_song_ready_flag
bne !+
jsr run_mm
lda menu_next_song_ready_flag
bne !+
jsr run_mm
lda menu_next_song_ready_flag
bne !+
jsr run_mm
lda menu_next_song_ready_flag
bne !+
jsr run_mm
lda menu_next_song_ready_flag
bne !+
!:
jsr close_mm
rts



open_ll:
petscii_load_sequence('L','L')
animate_open(ll)
rts

close_ll:
animate_close(ll)
rts

run_ll:
animate_part(ll)
rts

poll_ll:
jsr open_ll
lda menu_next_song_ready_flag
bne !+
jsr run_ll
lda menu_next_song_ready_flag
bne !+
jsr run_ll
lda menu_next_song_ready_flag
bne !+
jsr run_ll
lda menu_next_song_ready_flag
bne !+
jsr run_ll
lda menu_next_song_ready_flag
bne !+
!:
jsr close_ll
rts



open_ee:
petscii_load_sequence('E','E')
animate_open(ee)
rts

close_ee:
animate_close(ee)
rts

run_ee:
animate_part(ee)
rts

poll_ee:
jsr open_ee
lda menu_next_song_ready_flag
bne !+
jsr run_ee
lda menu_next_song_ready_flag
bne !+
jsr run_ee
lda menu_next_song_ready_flag
bne !+
jsr run_ee
lda menu_next_song_ready_flag
bne !+
jsr run_ee
lda menu_next_song_ready_flag
bne !+
!:
jsr close_ee
rts

open_cc:
petscii_load_sequence('C','C')
animate_open(cc)
rts

close_cc:
animate_close(cc)
rts

run_cc:
animate_part(cc)
rts

poll_cc:
jsr open_cc
lda menu_next_song_ready_flag
bne !+
jsr run_cc
lda menu_next_song_ready_flag
bne !+
jsr run_cc
lda menu_next_song_ready_flag
bne !+
jsr run_cc
lda menu_next_song_ready_flag
bne !+
jsr run_cc
lda menu_next_song_ready_flag
bne !+
!:
jsr close_cc
rts

open_aa:
petscii_load_sequence('A','A')
animate_open(aa)
rts

close_aa:
animate_close(aa)
rts

run_aa:
animate_part(aa)
rts

poll_aa:
jsr open_aa
lda menu_next_song_ready_flag
bne !+
jsr run_aa
lda menu_next_song_ready_flag
bne !+
jsr run_aa
lda menu_next_song_ready_flag
bne !+
jsr run_aa
lda menu_next_song_ready_flag
bne !+
jsr run_aa
lda menu_next_song_ready_flag
bne !+
!:
jsr close_aa
rts


/*
I have taken the guts of the macro from the Petscii include, but I need to have the ability to poll for song change! 
*/
.macro animate_part(sequence){
    .for(var i=4;i<sequence.size()/2;i++){
       petscii_render_frame(sequence, i, true, 254, 254) 
       lda menu_next_song_ready_flag
       beq !+
       rts
!:
    }
}

.macro animate_open(sequence){
    .for(var i=0;i<3;i++){
       petscii_render_frame(sequence, i, true, 254, 254) 
       .if(interframe_delay > 0){
        ldy #interframe_delay
        jsr pause
       }
    }
}

.macro animate_close(sequence){
    .for(var i=2;i>=0;i--){
       petscii_render_frame(sequence, i, true, 254, 254) 
       .if(interframe_delay > 0){
        ldy #interframe_delay
        jsr pause
       }
    }
}

