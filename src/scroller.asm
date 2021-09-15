/*
Scroller
*/
.var zp_1 = $ab
.var zp_2 = $ac
.var zp_3 = $ad
.var zp_4 = $ae


.var s_row = 0
.var s_font_page = $80

s_init:
    lda #s_font_page
    jsr s_copy_character_rom
s_init_scrolltext:
    lda #>s_scrolltext
    sta zp_2
    lda #<s_scrolltext
    sta zp_1
    rts 

s_scroll:
    jsr s_blit
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
    jsr s_render_char_slice
    rts


// Scroll char and color ram
s_blit:
    ldx #$01
!loop:
    .for(var i=0;i<8;i++){
        lda ($0400 + ((i + s_row) * 40)),x 
        sta ($03ff + ((i + s_row) * 40)),x 
        lda ($d800 + ((i + s_row) * 40)),x 
        sta ($d7ff + ((i + s_row) * 40)),x 
    }
    inx
    cpx #$28
    bne !loop-
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
    lda s_off_char
    sta $0400 + $27 + ((i + s_row) * 40)
    lda s_off_color
    sta $d800 + $27 + ((i + s_row) * 40)
    jmp !done+
!draw:
    lda s_on_chars + i
    sta $0400 + $27 + ((i + s_row) * 40)
    lda s_on_colors + (i * 8),x
    sta $d800 + $27 + ((i + s_row) * 40)
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
s_on_chars:
.byte $01, $02, $03, $04, $05, $06, $07, $08

s_off_char:
.byte $20

s_on_colors:
.byte $01, $02, $03, $04, $05, $06, $07, $08
.byte $01, $02, $03, $04, $05, $06, $07, $08
.byte $01, $02, $03, $04, $05, $06, $07, $08
.byte $01, $02, $03, $04, $05, $06, $07, $08
.byte $01, $02, $03, $04, $05, $06, $07, $08
.byte $01, $02, $03, $04, $05, $06, $07, $08
.byte $01, $02, $03, $04, $05, $06, $07, $08
.byte $01, $02, $03, $04, $05, $06, $07, $08

s_off_color:
.byte $00

s_scrolltext:
.text "hello this is a test "
.byte $00, $00
