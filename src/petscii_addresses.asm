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
  $30e7-$31a3 col_player_doo
  $31a4-$329c txt_player_dooropen1
  $329d-$3379 col_player_dooropen1
  $337a-$3442 txt_player_dooropen2
  $3443-$34fc col_player_dooropen2
  $34fd-$3595 txt_player_dooropen3
  $3596-$361f col_player_dooropen3
  $3620-$3705 txt_drummer1
  $3706-$37e6 col_drummer1
  $37e7-$38d0 txt_drummer2
  $38d1-$39b5 col_drummer2
  $39b6-$3a90 txt_drummer3
  $3a91-$3b69 col_drummer3
  $3b6a-$3c52 txt_drummer4
  $3c53-$3d39 col_drummer4

*/
.var aa = List();
.eval aa.add($3000,$30e7,$31a4,$329d,$337a,$3443,$34fd,$3596,$3620,$3706,$37e7,$38d1,$39b6,$3a91,$3b6a,$3c53)


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
  $30e7-$31a3 col_player_doo
  $31a4-$329c txt_player_dooropen1
  $329d-$3379 col_player_dooropen1
  $337a-$3442 txt_player_dooropen2
  $3443-$34fc col_player_dooropen2
  $34fd-$3595 txt_player_dooropen3
  $3596-$361f col_player_dooropen3
  $3620-$36e0 txt_irclefx1
  $36e1-$378e col_irclefx1
  $378f-$384f txt_irclefx2
  $3850-$38f5 col_irclefx2
  $38f6-$39d0 txt_irclefx3
  $39d1-$3a88 col_irclefx3
  $3a89-$3b71 txt_irclefx4
  $3b72-$3c3f col_irclefx4
  $3c40-$3d24 txt_irclefx5
  $3d25-$3df6 col_irclefx5
  $3df7-$3ecb txt_irclefx6
  $3ecc-$3f8d col_irclefx6
*/
.var cc = List()
.eval cc.add($3000,$30e7,$31a4,$329d,$337a,$3443,$34fd,$3596,$3620,$36e1,$378f,$3850,$38f6,$39d1,$3a89,$3b72,$3c40,$3d25,$3df7,$3ecc)


/*
moreskullz-segment: ee.prg
  $3000-$30e6 txt_player_doo
  $30e7-$31a3 col_player_doo
  $31a4-$329c txt_player_dooropen1
  $329d-$3379 col_player_dooropen1
  $337a-$3442 txt_player_dooropen2
  $3443-$34fc col_player_dooropen2
  $34fd-$3595 txt_player_dooropen3
  $3596-$361f col_player_dooropen3
  $3620-$3718 txt_moreskulls1
  $3719-$37f4 col_moreskulls1
  $37f5-$38ed txt_moreskulls2
  $38ee-$39c9 col_moreskulls2
  $39ca-$3ac2 txt_moreskulls3
  $3ac3-$3ba5 col_moreskulls3
  $3ba6-$3c9e txt_moreskulls4
  $3c9f-$3d7c col_moreskulls4
  $3d7d-$3e75 txt_moreskulls5
  $3e76-$3f52 col_moreskulls5
  $3f53-$404b txt_moreskulls6
  $404c-$412a col_moreskulls6
  $412b-$4220 txt_moreskulls7
  $4221-$4303 col_moreskulls7

*/
.var ee = List()
.eval ee.add($3000,$30e7,$31a4,$329d,$337a,$3443,$34fd,$3596,$3620,$3719,$37f5,$38ee,$39ca,$3ac3,$3ba6,$3c9f,$3d7d,$3e76,$3f53,$404c,$412b,$4221)


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
  $30e7-$31a3 col_player_doo
  $31a4-$329c txt_player_dooropen1
  $329d-$3379 col_player_dooropen1
  $337a-$3442 txt_player_dooropen2
  $3443-$34fc col_player_dooropen2
  $34fd-$3595 txt_player_dooropen3
  $3596-$361f col_player_dooropen3
  $3620-$369b txt_sk1
  $369c-$3718 col_sk1
  $3719-$37ba txt_sk2
  $37bb-$385b col_sk2
  $385c-$392a txt_sk3
  $392b-$39fa col_sk3
  $39fb-$3ad1 txt_sk4
  $3ad2-$3ba3 col_sk4
  $3ba4-$3c8f txt_sk5
  $3c90-$3d63 col_sk5
  $3d64-$3e4c txt_sk6
  $3e4d-$3f24 col_sk6
  $3f25-$4004 txt_sk7
  $4005-$40d6 col_sk7
  $40d7-$41a5 txt_sk8
  $41a6-$4267 col_sk8
  $4268-$4350 txt_sk9
  $4351-$442b col_sk9
  $442c-$44f7 txt_sk10
  $44f8-$45b5 col_sk10
  $45b6-$467b txt_sk11
  $467c-$4738 col_sk11
  $4739-$47eb txt_sk12
  $47ec-$489b col_sk12
*/
.var ll = List()
.eval ll.add($3000,$30e7,$31a4,$329d,$337a,$3443,$34fd,$3596,$3620,$369c,$3719,$37bb,$385c,$392b,$39fb,$3ad2,$3ba4,$3c90,$3d64,$3e4d,$3f25,$4005,$40d7,$41a6,$4268,$4351,$442c,$44f8,$45b6,$467c,$4739,$47ec)


/*
skull_rotate-segment: mm.prg
  $3000-$30e6 txt_player_doo
  $30e7-$31a3 col_player_doo
  $31a4-$329c txt_player_dooropen1
  $329d-$3379 col_player_dooropen1
  $337a-$3442 txt_player_dooropen2
  $3443-$34fc col_player_dooropen2
  $34fd-$3595 txt_player_dooropen3
  $3596-$361f col_player_dooropen3
  $3620-$36ed txt_skullrotate1
  $36ee-$37b3 col_skullrotate1
  $37b4-$387a txt_skullrotate2
  $387b-$393c col_skullrotate2
  $393d-$39fb txt_skullrotate3
  $39fc-$3aba col_skullrotate3
  $3abb-$3b78 txt_skullrotate4
  $3b79-$3c2c col_skullrotate4
  $3c2d-$3ce5 txt_skullrotate5
  $3ce6-$3d9e col_skullrotate5
  $3d9f-$3e63 txt_skullrotate6
  $3e64-$3f23 col_skullrotate6
*/
.var mm = List()
.eval mm.add($3000,$30e7,$31a4,$329d,$337a,$3443,$34fd,$3596,$3620,$36ee,$37b4,$387b,$393d,$39fc,$3abb,$3b79,$3c2d,$3ce6,$3d9f,$3e64)


/*
turn_disk-segment: nn.prg
  $3000-$30e6 txt_player_doo
  $30e7-$31a3 col_player_doo
  $31a4-$329c txt_player_dooropen1
  $329d-$3379 col_player_dooropen1
  $337a-$3442 txt_player_dooropen2
  $3443-$34fc col_player_dooropen2
  $34fd-$3595 txt_player_dooropen3
  $3596-$361f col_player_dooropen3
  $3620-$3688 txt_z_turndisk_bottom
  $3689-$36f2 col_z_turndisk_bottom
  $36f3-$37d0 txt_z_turndisk_top
  $37d1-$3884 col_z_turndisk_top
*/
.var nn = List()
.eval nn.add($3000,$30e7,$31a4,$329d,$337a,$3443,$34fd,$3596,$3620,$3689,$36f3,$37d1)



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
