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






/*
drummer-segment: aa.prg
  $3000-$30e6 txt_player_doo
  $30e7-$31a2 col_player_doo
  $31a3-$329b txt_player_dooropen1
  $329c-$3377 col_player_dooropen1
  $3378-$3440 txt_player_dooropen2
  $3441-$34f9 col_player_dooropen2
  $34fa-$3592 txt_player_dooropen3
  $3593-$361b col_player_dooropen3
  $361c-$3701 txt_drummer1
  $3702-$37e1 col_drummer1
  $37e2-$38cb txt_drummer2
  $38cc-$39af col_drummer2
  $39b0-$3a8a txt_drummer3
  $3a8b-$3b62 col_drummer3
  $3b63-$3c4b txt_drummer4
  $3c4c-$3d31 col_drummer4

*/
.var aa = List();
.eval aa.add($3000,$30e7,$31a3,$329c,$3378,$3441,$34fa,$3593,$361c,$3702,$37e2,$38cc,$39b0,$3a8b,$3b63,$3c4c)


/*
final-segment: bb.prg
  $3000-$3345 txt_final1
  $3346-$35aa col_final1
  $35ab-$38f0 txt_final2
  $38f1-$3b55 col_final2
*/
.var bb = List()
.eval bb.add($3000,$3346,$35ab,$38f1)


/*
circle-segment: cc.prg
  $3000-$30e6 txt_player_doo
  $30e7-$31a2 col_player_doo
  $31a3-$329b txt_player_dooropen1
  $329c-$3377 col_player_dooropen1
  $3378-$3440 txt_player_dooropen2
  $3441-$34f9 col_player_dooropen2
  $34fa-$3592 txt_player_dooropen3
  $3593-$361b col_player_dooropen3
  $361c-$36dc txt_irclefx1
  $36dd-$3789 col_irclefx1
  $378a-$384a txt_irclefx2
  $384b-$38ef col_irclefx2
  $38f0-$39ca txt_irclefx3
  $39cb-$3a81 col_irclefx3
  $3a82-$3b6a txt_irclefx4
  $3b6b-$3c37 col_irclefx4
  $3c38-$3d1c txt_irclefx5
  $3d1d-$3ded col_irclefx5
  $3dee-$3ec2 txt_irclefx6
  $3ec3-$3f83 col_irclefx6

*/
.var cc = List()
.eval cc.add($3000,$30e7,$31a3,$329c,$3378,$3441,$34fa,$3593,$361c,$36dd,$378a,$384b,$38f0,$39cb,$3a82,$3b6b,$3c38,$3d1d,$3dee,$3ec3)


/*
moreskullz-segment: ee.prg
  $3000-$30e6 txt_player_doo
  $30e7-$31a2 col_player_doo
  $31a3-$329b txt_player_dooropen1
  $329c-$3377 col_player_dooropen1
  $3378-$3440 txt_player_dooropen2
  $3441-$34f9 col_player_dooropen2
  $34fa-$3592 txt_player_dooropen3
  $3593-$361b col_player_dooropen3
  $361c-$3714 txt_moreskulls1
  $3715-$37ef col_moreskulls1
  $37f0-$38e8 txt_moreskulls2
  $38e9-$39c3 col_moreskulls2
  $39c4-$3abc txt_moreskulls3
  $3abd-$3b9e col_moreskulls3
  $3b9f-$3c97 txt_moreskulls4
  $3c98-$3d74 col_moreskulls4
  $3d75-$3e6d txt_moreskulls5
  $3e6e-$3f49 col_moreskulls5
  $3f4a-$4042 txt_moreskulls6
  $4043-$4120 col_moreskulls6
  $4121-$4216 txt_moreskulls7
  $4217-$42f8 col_moreskulls7

*/
.var ee = List()
.eval ee.add($3000,$30e7,$31a3,$329c,$3378,$3441,$34fa,$3593,$361c,$3715,$37f0,$38e9,$39c4,$3abd,$3b9f,$3c98,$3d75,$3e6e,$3f4a,$4043,$4121,$4217)


/*
logo_ons-segment: ff.prg
  $3000-$313c txt_onslogo_only
  $313d-$3213 col_onslogo_only
*/
.var ff = List()
.eval ff.add($3000,$313d)


/*
open-segment: gg.prg
  $3000-$3024 txt_open1
  $3025-$3037 col_open1
  $3038-$3069 txt_open2
  $306a-$3087 col_open2
  $3088-$30d7 txt_open3
  $30d8-$3102 col_open3
  $3103-$3170 txt_open4
  $3171-$31b3 col_open4
  $31b4-$3256 txt_open5
  $3257-$32be col_open5
  $32bf-$33ae txt_open6
  $33af-$345a col_open6
  $345b-$35ad txt_open7
  $35ae-$369e col_open7
  $369f-$387a txt_open8
  $387b-$3a05 col_open8
  $3a06-$3bc2 txt_open9
  $3bc3-$3d32 col_open9
*/
.var gg = List()
.eval gg.add($3000,$3025,$3038,$306a,$3088,$30d8,$3103,$3171,$31b4,$3257,$32bf,$33af,$345b,$35ae,$369f,$387b,$3a06,$3bc3)

/*
open_loop-segment: hh.prg
  $3000-$333e txt_openloop1
  $333f-$34c9 col_openloop1
  $34ca-$37c1 txt_openloop2
  $37c2-$3931 col_openloop2
  $3932-$3c5d txt_openloop3
  $3c5e-$3de8 col_openloop3
  $3de9-$40ae txt_openloop4
  $40af-$421e col_openloop4
*/
.var hh = List()
.eval hh.add($3000,$333f,$34ca,$37c2,$3932,$3c5e,$3de9,$40af)

/* 
playerbase-segment: ii.prg
  $3000-$325c txt_playe
  $325d-$3421 col_playe
  $3422-$3508 txt_player_doo
  $3509-$35c5 col_player_doo
*/
.var ii = List()
.eval ii.add($3000,$325d,$3422,$3509)



/*
credits-segment: kk.prg
  $3000-$3253 txt_redits
  $3254-$334f col_redits
*/
.var kk = List()
.eval kk.add($3000,$3254)

/*
sk-segment: ll.prg
  $3000-$30e6 txt_player_doo
  $30e7-$31a2 col_player_doo
  $31a3-$329b txt_player_dooropen1
  $329c-$3377 col_player_dooropen1
  $3378-$3440 txt_player_dooropen2
  $3441-$34f9 col_player_dooropen2
  $34fa-$3592 txt_player_dooropen3
  $3593-$361b col_player_dooropen3
  $361c-$3697 txt_sk1
  $3698-$3713 col_sk1
  $3714-$37b5 txt_sk2
  $37b6-$3855 col_sk2
  $3856-$3924 txt_sk3
  $3925-$39f3 col_sk3
  $39f4-$3aca txt_sk4
  $3acb-$3b9b col_sk4
  $3b9c-$3c87 txt_sk5
  $3c88-$3d5a col_sk5
  $3d5b-$3e43 txt_sk6
  $3e44-$3f1a col_sk6
  $3f1b-$3ffa txt_sk7
  $3ffb-$40cb col_sk7
  $40cc-$419a txt_sk8
  $419b-$425b col_sk8
  $425c-$4344 txt_sk9
  $4345-$441e col_sk9
  $441f-$44ea txt_sk10
  $44eb-$45a7 col_sk10
  $45a8-$466d txt_sk11
  $466e-$4729 col_sk11
  $472a-$47dc txt_sk12
  $47dd-$488b col_sk12
*/
.var ll = List()
.eval ll.add($3000,$30e7,$31a3,$329c,$3378,$3441,$34fa,$3593,$361c,$3698,$3714,$37b6,$3856,$3925,$39f4,$3acb,$3b9c,$3c88,$3d5b,$3e44,$3f1b,$3ffb,$40cc,$419b,$425c,$4345,$441f,$44eb,$45a8,$466e,$472a,$47dd)


/*
skull_rotate-segment: mm.prg
  $3000-$30e6 txt_player_doo
  $30e7-$31a2 col_player_doo
  $31a3-$329b txt_player_dooropen1
  $329c-$3377 col_player_dooropen1
  $3378-$3440 txt_player_dooropen2
  $3441-$34f9 col_player_dooropen2
  $34fa-$3592 txt_player_dooropen3
  $3593-$361b col_player_dooropen3
  $361c-$36e9 txt_skullrotate1
  $36ea-$37ae col_skullrotate1
  $37af-$3875 txt_skullrotate2
  $3876-$3936 col_skullrotate2
  $3937-$39f5 txt_skullrotate3
  $39f6-$3ab3 col_skullrotate3
  $3ab4-$3b71 txt_skullrotate4
  $3b72-$3c24 col_skullrotate4
  $3c25-$3cdd txt_skullrotate5
  $3cde-$3d95 col_skullrotate5
  $3d96-$3e5a txt_skullrotate6
  $3e5b-$3f19 col_skullrotate6
*/
.var mm = List()
.eval mm.add($3000,$30e7,$31a3,$329c,$3378,$3441,$34fa,$3593,$361c,$36ea,$37af,$3876,$3937,$39f6,$3ab4,$3b72,$3c25,$3cde,$3d96,$3e5b)


/*
turn_disk-segment: nn.prg
  $3000-$30e6 txt_player_doo
  $30e7-$31a2 col_player_doo
  $31a3-$329b txt_player_dooropen1
  $329c-$3377 col_player_dooropen1
  $3378-$3440 txt_player_dooropen2
  $3441-$34f9 col_player_dooropen2
  $34fa-$3592 txt_player_dooropen3
  $3593-$361b col_player_dooropen3
  $361c-$36f9 txt_z_turndisk_top
  $36fa-$37ac col_z_turndisk_top
*/
.var nn = List()
.eval nn.add($3000,$30e7,$31a3,$329c,$3378,$3441,$34fa,$3593,$361c,$36fa)














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
