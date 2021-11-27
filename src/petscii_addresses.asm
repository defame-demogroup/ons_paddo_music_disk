/*
Memory Map
----------
These are the raw addresses of each of the 
animation frames based on the file groups
in petscii_include.asm 

Need to have this since we are dynamically
loading the groups of frames into the animation
buffer...

You need to load, de-exomize and then 
use these labels to actually address 
the animation frames for the rle-depacker!

See MACROS at the end of this to use the animation frames!
*/

// Timeline 1 assets

/*
open-segment: gg.prg
  $1800-$1824 txt_open1
  $1825-$1837 col_open1
  $1838-$1869 txt_open2
  $186a-$1887 col_open2
  $1888-$18d7 txt_open3
  $18d8-$1902 col_open3
  $1903-$1970 txt_open4
  $1971-$19b3 col_open4
  $19b4-$1a56 txt_open5
  $1a57-$1abe col_open5
  $1abf-$1bae txt_open6
  $1baf-$1c5a col_open6
  $1c5b-$1dad txt_open7
  $1dae-$1e9e col_open7
  $1e9f-$207a txt_open8
  $207b-$2205 col_open8
  $2206-$23c2 txt_open9
  $23c3-$2532 col_open9
*/
.var gg = List()
.eval gg.add($1800,$1825,$1838,$186a,$1888,$18d8,$1903,$1971,$19b4,$1a57,$1abf,$1baf,$1c5b,$1dae,$1e9f,$207b,$2206,$23c3)

/*
open_loop-segment: hh.prg
  $2600-$293e txt_openloop1
  $293f-$2ac9 col_openloop1
  $2aca-$2dc1 txt_openloop2
  $2dc2-$2f31 col_openloop2
  $2f32-$325d txt_openloop3
  $325e-$33e8 col_openloop3
  $33e9-$36ae txt_openloop4
  $36af-$381e col_openloop4
*/
.var hh = List()
.eval hh.add($2600,$293f,$2aca,$2dc2,$2f32,$325e,$33e9,$36af)

/*
close: jj.prg
  $3900-$3c8b txt_lose1
  $3c8c-$3ee3 col_lose1
  $3ee4-$424c txt_lose2
  $424d-$450a col_lose2
  $450b-$488b txt_lose3
  $488c-$4b8f col_lose3
  $4b90-$4f14 txt_lose4
  $4f15-$51f2 col_lose4
*/
.var jj = List()
.eval jj.add($3900,$3c8c,$3ee4,$424d,$450b,$488c,$4b90,$4f15)

/*
final-segment: bb.prg
  $a000-$a345 txt_final1
  $a346-$a5aa col_final1
  $a5ab-$a8f0 txt_final2
  $a8f1-$ab55 col_final2
*/
.var bb = List()
.eval bb.add($a000,$a346,$a5ab,$a8f1)


// Timeline 2 Assets

/*
drummer-segment: aa.prg
  $a000-$a0e6 txt_player_doo
  $a0e7-$a1a2 col_player_doo
  $a1a3-$a29b txt_player_dooropen1
  $a29c-$a377 col_player_dooropen1
  $a378-$a440 txt_player_dooropen2
  $a441-$a4f9 col_player_dooropen2
  $a4fa-$a592 txt_player_dooropen3
  $a593-$a61b col_player_dooropen3
  $a61c-$a701 txt_drummer1
  $a702-$a7e1 col_drummer1
  $a7e2-$a8cb txt_drummer2
  $a8cc-$a9af col_drummer2
  $a9b0-$aa8a txt_drummer3
  $aa8b-$ab62 col_drummer3
  $ab63-$ac4b txt_drummer4
  $ac4c-$ad31 col_drummer4

*/
.var aa = List();
.eval aa.add($a000,$a0e7,$a1a3,$a29c,$a378,$a441,$a4fa,$a593,$a61c,$a702,$a7e2,$a8cc,$a9b0,$aa8b,$ab63,$ac4c)

/*
circle-segment: cc.prg
  $a000-$a0e6 txt_player_doo
  $a0e7-$a1a2 col_player_doo
  $a1a3-$a29b txt_player_dooropen1
  $a29c-$a377 col_player_dooropen1
  $a378-$a440 txt_player_dooropen2
  $a441-$a4f9 col_player_dooropen2
  $a4fa-$a592 txt_player_dooropen3
  $a593-$a61b col_player_dooropen3
  $a61c-$a6ae txt_zz_ls7
  $a6af-$a741 col_zz_ls7
  $a742-$a7e1 txt_zz_ls9
  $a7e2-$a881 col_zz_ls9
  $a882-$a92d txt_zz_ls11
  $a92e-$a9d7 col_zz_ls11
  $a9d8-$aa92 txt_zz_ls13
  $aa93-$ab4a col_zz_ls13
  $ab4b-$ac09 txt_zz_ls15
  $ac0a-$acc5 col_zz_ls15
  $acc6-$ad87 txt_zz_ls17
  $ad88-$ae46 col_zz_ls17
  $ae47-$af06 txt_zz_ls19
  $af07-$afc1 col_zz_ls19
  $afc2-$b082 txt_zz_ls21
  $b083-$b13c col_zz_ls21
  $b13d-$b201 txt_zz_ls23
  $b202-$b2c1 col_zz_ls23
  $b2c2-$b387 txt_zz_ls25
  $b388-$b449 col_zz_ls25
  $b44a-$b50f txt_zz_ls27
  $b510-$b5cf col_zz_ls27
  $b5d0-$b695 txt_zz_ls29
  $b696-$b754 col_zz_ls29
  $b755-$b81d txt_zz_ls31
  $b81e-$b8e1 col_zz_ls31
  $b8e2-$b9aa txt_zz_ls33
  $b9ab-$ba6f col_zz_ls33
  $ba70-$bb36 txt_zz_ls35
  $bb37-$bbf9 col_zz_ls35
  $bbfa-$bcb1 txt_zz_ls37
  $bcb2-$bd65 col_zz_ls37
  $bd66-$be0b txt_zz_ls39
  $be0c-$beaf col_zz_ls39

*/
.var cc = List()
.eval cc.add($a000,$a0e7,$a1a3,$a29c,$a378,$a441,$a4fa,$a593,$a61c,$a6af,$a742,$a7e2,$a882,$a92e,$a9d8,$aa93,$ab4b,$ac0a,$acc6,$ad88,$ae47,$af07,$afc2,$b083,$b13d,$b202,$b2c2,$b388,$b44a,$b510,$b5d0,$b696,$b755,$b81e,$b8e2,$b9ab,$ba70,$bb37,$bbfa,$bcb2,$bd66,$be0c)


/*
moreskullz-segment: ee.prg
  $a000-$a0e6 txt_player_doo
  $a0e7-$a1a2 col_player_doo
  $a1a3-$a29b txt_player_dooropen1
  $a29c-$a377 col_player_dooropen1
  $a378-$a440 txt_player_dooropen2
  $a441-$a4f9 col_player_dooropen2
  $a4fa-$a592 txt_player_dooropen3
  $a593-$a61b col_player_dooropen3
  $a61c-$a714 txt_moreskulls1
  $a715-$a7ef col_moreskulls1
  $a7f0-$a8e8 txt_moreskulls2
  $a8e9-$a9c3 col_moreskulls2
  $a9c4-$aabc txt_moreskulls3
  $aabd-$ab9e col_moreskulls3
  $ab9f-$ac97 txt_moreskulls4
  $ac98-$ad74 col_moreskulls4
  $ad75-$ae6d txt_moreskulls5
  $ae6e-$af49 col_moreskulls5
  $af4a-$b042 txt_moreskulls6
  $b043-$b120 col_moreskulls6
  $b121-$b216 txt_moreskulls7
  $b217-$b2f8 col_moreskulls7

*/
.var ee = List()
.eval ee.add($a000,$a0e7,$a1a3,$a29c,$a378,$a441,$a4fa,$a593,$a61c,$a715,$a7f0,$a8e9,$a9c4,$aabd,$ab9f,$ac98,$ad75,$ae6e,$af4a,$b043,$b121,$b217)


/*
logo_ons-segment: ff.prg
  $a000-$a13c txt_onslogo_only
  $a13d-$a213 col_onslogo_only
*/
.var ff = List()
.eval ff.add($a000,$a13d)


/* 
playerbase-segment: ii.prg
  $a000-$a25c txt_playe
  $a25d-$a421 col_playe
  $a422-$a508 txt_player_doo
  $a509-$a5c5 col_player_doo
*/
.var ii = List()
.eval ii.add($a000,$a25d,$a422,$a509)



/*
credits-segment: kk.prg
  $a000-$a253 txt_redits
  $a254-$a34f col_redits
*/
.var kk = List()
.eval kk.add($a000,$a254)

/*
sk-segment: ll.prg
  $a000-$a0e6 txt_player_doo
  $a0e7-$a1a2 col_player_doo
  $a1a3-$a29b txt_player_dooropen1
  $a29c-$a377 col_player_dooropen1
  $a378-$a440 txt_player_dooropen2
  $a441-$a4f9 col_player_dooropen2
  $a4fa-$a592 txt_player_dooropen3
  $a593-$a61b col_player_dooropen3
  $a61c-$a697 txt_sk1
  $a698-$a713 col_sk1
  $a714-$a7b5 txt_sk2
  $a7b6-$a855 col_sk2
  $a856-$a924 txt_sk3
  $a925-$a9f3 col_sk3
  $a9f4-$aaca txt_sk4
  $aacb-$ab9b col_sk4
  $ab9c-$ac87 txt_sk5
  $ac88-$ad5a col_sk5
  $ad5b-$ae43 txt_sk6
  $ae44-$af1a col_sk6
  $af1b-$affa txt_sk7
  $affb-$b0cb col_sk7
  $b0cc-$b19a txt_sk8
  $b19b-$b25b col_sk8
  $b25c-$b344 txt_sk9
  $b345-$b41e col_sk9
  $b41f-$b4ea txt_sk10
  $b4eb-$b5a7 col_sk10
  $b5a8-$b66d txt_sk11
  $b66e-$b729 col_sk11
  $b72a-$b7dc txt_sk12
  $b7dd-$b88b col_sk12
*/
.var ll = List()
.eval ll.add($a000,$a0e7,$a1a3,$a29c,$a378,$a441,$a4fa,$a593,$a61c,$a698,$a714,$a7b6,$a856,$a925,$a9f4,$aacb,$ab9c,$ac88,$ad5b,$ae44,$af1b,$affb,$b0cc,$b19b,$b25c,$b345,$b41f,$b4eb,$b5a8,$b66e,$b72a,$b7dd)


/*
skull_rotate-segment: mm.prg
  $a000-$a0e6 txt_player_doo
  $a0e7-$a1a2 col_player_doo
  $a1a3-$a29b txt_player_dooropen1
  $a29c-$a377 col_player_dooropen1
  $a378-$a440 txt_player_dooropen2
  $a441-$a4f9 col_player_dooropen2
  $a4fa-$a592 txt_player_dooropen3
  $a593-$a61b col_player_dooropen3
  $a61c-$a6e9 txt_skullrotate1
  $a6ea-$a7ae col_skullrotate1
  $a7af-$a875 txt_skullrotate2
  $a876-$a936 col_skullrotate2
  $a937-$a9f5 txt_skullrotate3
  $a9f6-$aab3 col_skullrotate3
  $aab4-$ab71 txt_skullrotate4
  $ab72-$ac24 col_skullrotate4
  $ac25-$acdd txt_skullrotate5
  $acde-$ad95 col_skullrotate5
  $ad96-$ae5a txt_skullrotate6
  $ae5b-$af19 col_skullrotate6
*/
.var mm = List()
.eval mm.add($a000,$a0e7,$a1a3,$a29c,$a378,$a441,$a4fa,$a593,$a61c,$a6ea,$a7af,$a876,$a937,$a9f6,$aab4,$ab72,$ac25,$acde,$ad96,$ae5b)


/*
turn_disk-segment: nn.prg
  $a000-$a0e6 txt_player_doo
  $a0e7-$a1a2 col_player_doo
  $a1a3-$a29b txt_player_dooropen1
  $a29c-$a377 col_player_dooropen1
  $a378-$a440 txt_player_dooropen2
  $a441-$a4f9 col_player_dooropen2
  $a4fa-$a592 txt_player_dooropen3
  $a593-$a61b col_player_dooropen3
  $a61c-$a6f9 txt_z_turndisk_top
  $a6fa-$a7ac col_z_turndisk_top
*/
.var nn = List()
.eval nn.add($a000,$a0e7,$a1a3,$a29c,$a378,$a441,$a4fa,$a593,$a61c,$a6fa)














/*
----------------------------------------------------------------------------------------
Macros
----------------------------------------------------------------------------------------
*/

.macro petscii_load_sequence(filenameA, filenameB){
    load(filenameA,filenameB,$c000) 
    jsr exo_exo
}

.macro petscii_animate(sequence, use_transparency, text_transparent_value, color_transparent_value, interframe_delay){
    .for(var i=0;i<sequence.size()/2;i++){
       petscii_render_frame(sequence, i, use_transparency, text_transparent_value, color_transparent_value) 
       .if(interframe_delay > 0){
        ldy #interframe_delay
        jsr pause
       }
    }
}

.macro petscii_animate_reverse(sequence, use_transparency, text_transparent_value, color_transparent_value, interframe_delay){
    .for(var i=(sequence.size()/2)-1;i>=0;i--){
       petscii_render_frame(sequence, i, use_transparency, text_transparent_value, color_transparent_value) 
       .if(interframe_delay > 0){
        ldy #interframe_delay
        jsr pause
       }
    }
}

.macro petscii_render_frame(sequence, frame, use_transparency, text_transparent_value, color_transparent_value){
    // .printnow(sequence.size())
    // .printnow(frame)
    .var idx = (frame * 2)
    .var txt = sequence.get(idx)
    .var col = sequence.get(idx+1)
    .if(use_transparency){
        lda #text_transparent_value
        jsr upk_enable_transparency
    }else{
        jsr upk_disable_transparency
    }
    ldx #<txt
    ldy #>txt
    lda #$04
    jsr upk

    .if(use_transparency){
        lda #color_transparent_value
        jsr upk_enable_transparency
    // }else{
    //     jsr upk_disable_transparency
    }
    ldx #<col
    ldy #>col
    lda #$d8
    jsr upk
}
