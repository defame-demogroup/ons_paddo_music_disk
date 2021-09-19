/*
Scroller
*/
.var zp_1 = $ab
.var zp_2 = $ac
.var zp_3 = $ad
.var zp_4 = $ae


.var s_row = 16
.var s_font_page = $80

s_init:
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

s_scroll:
    inc $d020
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

s_charmask:
.byte 209,215,213,206,205,201,215,209, 213,242,219,192,192,219,242,201, 078,206,205,206,205,206,205,077, 203,250,224,207,208,224,204,202, 209,215,213,206,205,201,215,209
.byte 215,205,078,213,201,077,206,215, 168,235,203,213,201,202,243,169, 206,077,206,205,206,205,078,205, 207,202,073,066,066,085,203,208, 215,205,078,213,201,077,206,215
.byte 213,078,213,078,077,201,077,201, 235,203,213,241,241,201,202,243, 205,206,213,078,077,201,205,206, 208,213,075,091,091,074,201,207, 213,078,213,078,077,201,077,201
.byte 206,213,078,205,206,077,201,205, 161,213,203,078,205,202,201,161, 206,205,078,078,077,077,206,205, 201,208,085,091,091,073,207,213, 206,213,078,205,206,077,201,205
.byte 205,202,077,206,205,078,203,206, 186,202,201,205,078,213,203,186, 205,206,077,077,078,078,205,206, 203,250,074,091,091,075,204,202, 205,202,077,206,205,078,203,206
.byte 202,077,202,077,078,203,078,203, 235,201,202,242,242,203,213,243, 206,205,202,077,078,203,206,205, 250,202,073,091,091,085,203,204, 202,077,202,077,078,203,078,203
.byte 215,206,077,202,203,078,205,215, 168,235,201,202,203,213,243,169, 205,078,205,206,205,206,077,206, 204,213,075,066,066,074,201,250, 215,206,077,202,203,078,205,215
.byte 209,215,202,205,206,203,215,209, 202,241,219,192,192,219,241,203, 077,205,206,205,206,205,206,078, 201,208,224,204,250,224,207,213, 209,215,202,205,206,203,215,209

s_colormask:
.byte 07,07,07,07,07,07,07,07, 13,13,03,07,07,03,13,13, 07,07,07,07,07,07,07,07, 07,07,07,13,13,07,07,07, 07,07,07,07,07,07,07,07
.byte 07,03,03,13,13,03,03,07, 13,03,07,07,07,07,03,13, 07,13,03,03,03,03,13,07, 03,03,03,13,13,03,03,03, 07,03,03,13,13,03,03,07
.byte 07,03,03,13,13,03,03,07, 03,03,07,07,07,07,03,03, 07,03,03,07,07,03,03,07, 07,03,03,13,13,03,03,07, 07,03,03,13,13,03,03,07
.byte 07,13,13,07,07,13,13,07, 07,07,07,13,13,07,07,07, 07,03,07,13,13,07,03,07, 07,07,13,13,13,13,07,07, 07,13,13,07,07,13,13,07
.byte 07,13,13,07,07,13,13,07, 07,07,07,13,13,07,07,07, 07,03,07,13,13,07,03,07, 07,07,13,13,13,13,07,07, 07,13,13,07,07,13,13,07
.byte 07,03,03,13,13,03,03,07, 03,03,07,07,07,07,03,03, 07,03,03,07,07,03,03,07, 07,03,03,13,13,03,03,07, 07,03,03,13,13,03,03,07
.byte 07,03,03,13,13,03,03,07, 13,03,03,07,07,03,03,13, 07,13,03,03,03,03,13,07, 03,03,03,13,13,03,03,03, 07,03,03,13,13,03,03,07
.byte 07,07,07,07,07,07,07,07, 13,13,03,07,07,03,13,13, 07,07,07,07,07,07,07,07, 07,07,07,13,13,07,07,07, 07,07,07,07,07,07,07,07
