/*
Scroller
*/
.var zp_1 = $ab
.var zp_2 = $ac
.var zp_3 = $ad
.var zp_4 = $ae


.var s_row = 16
.var s_font_page = $80

/*
Scroll init
*/
s_init:
    jsr s_ts_reset
    lda #s_font_page
    jsr s_copy_character_rom
!loop:
    .for(var i=0;i<8;i++){
        lda (s_charmask + (i * 40)),x 
        sta ($0400 + ((i + s_row) * 40)),x 
    }
    inx
    cpx #$28
    bne !loop-
s_init_scrolltext:
    lda #>s_scrolltext
    sta zp_2
    lda #<s_scrolltext
    sta zp_1
    ldx #$00
    rts 

/*
Scroll IRQ call
*/
s_scroll:
    inc $d020
    jsr s_tile_shuffle
    jsr s_blit
    inc $d020
    lda s_current_char_counter
    bne !scroll_char+
    jsr s_load_new_char
    cmp #$00
    bne !load_char+
    jsr s_init_scrolltext
    jsr s_load_new_char
!load_char:
    jsr s_push_char_to_buffer
!scroll_char:
    inc $d020
    jsr s_render_char_slice
    lda #$00
    sta $d020
    rts

// Shuffle tiles on the canvas
s_tile_shuffle:
    jsr s_ts_tick
    bne !+
    rts
!:  jsr s_ts_next_move
    how to animate over the top of tiles? 
    copy src to buffer
    copy dest to src location
    draw src +/- 1 
    until src buffer at dst indx (commit)


s_ts_slide_tile:
    lda s_ts_src_tile_direction
    beq !go_left+
!go_right:
    // change the under to be the full suze of 
    the tiles (40 chars) and just grab columns 
    as you slid ethe new one over the top


//todo - keep going!
s_ts_copy_tile:
    ldx s_ts_src_tile_index
    ldy #$00
!:
    .for(var i=0;i<8;i++){
        lda s_charmask + (i * 40),x
        sta s_ts_picked_up_char + (i * 8),y
        sta s_ts_behind_char + (i * 8),y
        lda s_colormask + (i * 40),x
        sta s_ts_picked_up_color + (i * 8),y
        sta s_ts_behind_color + (i * 8),y
    }
    inx
    iny
    cpy #$08
    bne !-
    rts

s_ts_next_move:
    ldx s_ts_tile_ptr
    lda s_ts_tile_moves,x
    asl
    asl
    asl
    sta s_ts_src_tile_index
    inx
    lda s_ts_tile_moves,x
    asl
    asl
    asl
    sta s_ts_dst_tile_index
    inx
    lda s_ts_tile_moves,x
    sta s_ts_src_tile_direction
    inx
    stx s_ts_tile_ptr
    lda s_ts_tile_moves,x
    cmp #$ff
    beq !+
    rts    
    lda #$00
    sta s_ts_tile_ptr
    rts


s_ts_reset:
    lda #$00
    sta s_ts_delay
    lda #$01
    sta s_ts_delay + 1
    rts

s_ts_tick:
    dec s_ts_delay
    bne !+
    dec s_ts_delay + 1
    bne !+
    jsr s_ts_reset
    lda #$01
    rts
!:  
    lda #$00
    rts

// Scroll char and color ram
s_blit:
    ldx #$00
!loop:
    .for(var i=0;i<8;i++){
        lda (s_colormask + (i * 40)),x 
        and (s_render_buffer + (i * 40)),x 
        sta ($d800 + ((i + s_row) * 40)),x 
        lda (s_render_buffer + (i * 40) + 1),x 
        sta (s_render_buffer + (i * 40)),x 
    }
    inx
    cpx #$28
    beq !done+
    jmp !loop-
!done:
    rts

// Load New Char
s_load_new_char:
    ldy #$00
    lda (zp_1),y
    inc zp_1
    bne !+
    inc zp_2
!:  rts

// Push Char to the Buffer
s_push_char_to_buffer:
    ldy #$00
    sty OffsetHi
	clc
	asl 
	rol OffsetHi
	asl
	rol OffsetHi
	asl
	rol OffsetHi
	sta zp_3
	clc
	lda OffsetHi: #$00
	adc #s_font_page
	sta zp_4
!loop:
	lda (zp_3),y
	sta s_current_char_buffer,y
	iny
	cpy #$08
	bne !loop-
	rts

//render slice to the screen and color RAM
s_render_char_slice:
    ldx s_current_char_counter
.for (var i=0;i<8;i++){
    clc
    asl s_current_char_buffer + i
    bcs !draw+
    lda #$ff
    sta s_render_buffer + $27 + (i * 40)
    jmp !done+
!draw:
    lda #$02
    sta s_render_buffer + $27 + (i * 40)
!done:
}
    inc s_current_char_counter
    lda s_current_char_counter
    cmp #$08
    bne !skip+
    lda #$00
    sta s_current_char_counter
!skip:
    rts

/*
a: page in RAM to copy char roms into
*/
s_copy_character_rom:
    sei
    sta zp_4
    lda $01
    sta s_target + 1
    ldx #$04
    lda #$33
    sta $01
    lda #$d8
    sta zp_2
    ldy #$00
    sty zp_1
    sty zp_3       
!loop:
    lda (zp_1),y
    sta (zp_3),y
    iny        
    bne !loop-   
    inc zp_2
    inc zp_4   
    dex        
    bne !loop-  
s_target:
    lda #$37   
    sta $01
    cli
    rts

s_current_char_buffer:
.fill $08, $00

s_current_char_counter:
.byte $00

//these get rendered onto the screen - set up to suit style 

s_off_char:
.byte $20

s_off_color:
.byte $00

s_scrolltext:
.text "Well hello there... This is a test of the scroller. It started out as a simple text scroller but basically it sucked once it had the beautiful petscii art scrolling - so I made it stay still instead and made the scroller overlay on top. I think it looks nice!            "
.text "...The example you have seen is running the scroller, loading animations and a music, decompressing and then running them all"
.byte $00, $00

s_render_buffer:
.fill 40 * 8, $00

s_ts_delay:
    .byte 0, 0

s_ts_tile_ptr:
    .byte 0

/*
Tile moves are 
byte 1: start tile index (* 8 for offset)
byte 2: destination tile index (* 8 for offset)
byte 3: move direction - 0: left, 1: right
*/
s_ts_tile_moves:
    .byte 0,1,1
    .byte 4,0,0
    .byte 2,3,1
    .byte 3,0,0
    .byte 4,1,0
    .byte 1,4,1
    .byte $ff

s_ts_src_tile_index:
    .byte 0

s_ts_dst_tile_index:
    .byte 0

s_ts_src_tile_direction:
    .byte 0

s_ts_picked_up_char:
    .fill 8 * 8, 0

s_ts_picked_up_color:
    .fill 8 * 8, 0

s_ts_behind_char:
    .fill 8 * 8, 0

s_ts_behind_color:
    .fill 8 * 8, 0



s_charmask:
.byte 213,242,219,192,192,219,242,201, 209,215,213,206,205,201,215,209, 078,206,205,206,205,206,205,077, 203,250,224,207,208,224,204,202, 213,242,219,192,192,219,242,201
.byte 168,235,203,213,201,202,243,169, 215,205,206,213,201,205,206,215, 206,205,206,205,206,205,206,205, 207,202,201,194,194,213,203,208, 168,235,203,213,201,202,243,169
.byte 235,203,213,241,241,201,202,243, 213,206,213,206,205,201,205,201, 205,206,213,206,205,201,205,206, 208,213,203,219,219,202,201,207, 235,203,213,241,241,201,202,243
.byte 161,213,203,206,205,202,201,161, 206,213,206,205,206,205,201,205, 206,205,206,206,205,205,206,205, 201,208,213,241,241,201,207,213, 161,213,203,206,205,202,201,161
.byte 186,202,201,205,206,213,203,186, 205,202,205,206,205,206,203,206, 205,206,205,205,206,206,205,206, 203,250,202,242,242,203,204,202, 186,202,201,205,206,213,203,186
.byte 235,201,202,242,242,203,213,243, 202,205,202,205,206,203,206,203, 206,205,202,205,206,203,206,205, 250,202,201,219,219,213,203,204, 235,201,202,242,242,203,213,243
.byte 168,235,201,202,203,213,243,169, 215,206,205,202,203,206,205,215, 205,206,205,206,205,206,205,206, 204,213,203,194,194,202,201,250, 168,235,201,202,203,213,243,169
.byte 202,241,219,192,192,219,241,203, 209,215,202,205,206,203,215,209, 077,205,206,205,206,205,206,078, 201,208,224,204,250,224,207,213, 202,241,219,192,192,219,241,203

s_colormask:
.byte 07,07,07,07,07,07,07,07, 13,13,03,07,07,03,13,13, 07,07,07,07,07,07,07,07, 07,07,07,13,13,07,07,07, 07,07,07,07,07,07,07,07
.byte 07,03,03,13,13,03,03,07, 13,03,03,07,07,03,03,13, 07,13,03,03,03,03,13,07, 03,03,03,13,13,03,03,03, 07,03,03,13,13,03,03,07
.byte 07,03,03,13,13,03,03,07, 03,03,07,07,07,07,03,03, 07,03,03,07,07,03,03,07, 07,03,03,13,13,03,03,07, 07,03,03,13,13,03,03,07
.byte 07,13,13,13,07,13,13,07, 07,07,07,13,13,07,07,07, 07,03,07,13,13,07,03,07, 07,07,13,13,13,13,07,07, 07,13,13,13,07,13,13,07
.byte 07,13,13,07,13,13,13,07, 07,07,07,13,13,07,07,07, 07,03,07,13,13,07,03,07, 07,07,13,13,13,13,07,07, 07,13,13,07,13,13,13,07
.byte 07,03,03,13,13,03,03,07, 03,03,07,07,07,07,03,03, 07,03,03,07,07,03,03,07, 07,03,03,13,13,03,03,07, 07,03,03,13,13,03,03,07
.byte 07,03,03,13,13,03,03,07, 13,03,03,07,07,03,03,13, 07,13,03,03,03,03,13,07, 03,03,03,13,13,03,03,03, 07,03,03,13,13,03,03,07
.byte 07,07,07,07,07,07,07,07, 13,13,03,07,07,03,13,13, 07,07,07,07,07,07,07,07, 07,07,07,13,13,07,07,07, 07,07,07,07,07,07,07,07
