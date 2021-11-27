/*
Scroller
*/
.var zp_1 = $ab
.var zp_2 = $ac
.var zp_3 = $ad
.var zp_4 = $ae


.var s_row = 16
.var s_font_page = $78   //stick font
/*
Scroll init
*/
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

/*
Scroll IRQ call
*/
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
    jsr s_setting_scroll_routine: s_render_char_slice
    rts

s_switch_alt:
    lda #<s_render_char_slice_alt
    sta s_setting_scroll_routine
    lda #>s_render_char_slice_alt
    sta s_setting_scroll_routine + 1
    rts

s_switch_main:
    lda #<s_render_char_slice
    sta s_setting_scroll_routine
    lda #>s_render_char_slice
    sta s_setting_scroll_routine + 1
    rts


// Scroll char and color ram
s_blit:
    ldx #$00
!loop:
    .for(var i=0;i<8;i++){
        lda ($d800 + ((i + s_row) * 40) + 1),x 
        sta ($d800 + ((i + s_row) * 40)),x 
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
        lda s_colormask + (8 * i),x
        jmp !done+
    !draw:
        lda #$02
    !done:
        sta $d800 + $27 + ((i + s_row) * 40)
    }
    inc s_current_char_counter
    lda s_current_char_counter
    cmp #$07
    bne !skip+
    lda #$00
    sta s_current_char_counter
!skip:
    rts

//render slice to the screen and color RAM
s_render_char_slice_alt:
    ldx s_current_char_counter
    .for (var i=0;i<8;i++){
        clc
        asl s_current_char_buffer + i
        bcs !draw+
        lda s_colormask_alt +  i
        jmp !done+
    !draw:
        lda #$00
    !done:
        sta $d800 + $27 + ((i + s_row) * 40)
    }
    inc s_current_char_counter
    lda s_current_char_counter
    cmp #$07
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
    sta s_target
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
    lda s_target: #$36   
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

.align $100
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

.byte 07,07,15,15,03,03,13,13
.byte 13,07,07,15,15,03,03,13
.byte 13,13,07,07,15,15,03,03
.byte 03,13,13,07,07,15,15,03
.byte 03,03,13,13,07,07,15,15
.byte 15,03,03,13,13,07,07,15
.byte 15,15,03,03,13,13,07,07
.byte 07,15,15,03,03,13,13,07






s_colormask_alt:
.byte 0,0,0,0,0,0,0,0

/*
Variations of the scroller tile to test
*/
// .byte $0f,$07,$03,$0d,$0f,$07,$03,$0d
// .byte $07,$03,$0d,$0f,$07,$03,$0d,$0f
// .byte $03,$0d,$0f,$07,$03,$0d,$0f,$07
// .byte $0d,$0f,$07,$03,$0d,$0f,$07,$03
// .byte $0f,$07,$03,$0d,$0f,$07,$03,$0d
// .byte $07,$03,$0d,$0f,$07,$03,$0d,$0f
// .byte $03,$0d,$0f,$07,$03,$0d,$0f,$07
// .byte $0d,$0f,$07,$03,$0d,$0f,$07,$03

// .byte 15,15,15,15,15,15,15,15   
// .byte 03,13,13,03,03,13,13,03   
// .byte 03,13,03,07,07,03,13,03   
// .byte 13,03,07,13,13,07,03,13   
// .byte 13,03,07,13,13,07,03,13   
// .byte 03,13,03,07,07,03,13,03   
// .byte 03,13,13,03,03,13,13,03   
// .byte 15,15,15,15,15,15,15,15   

// .byte 15,15,15,15,15,15,15,15
// .byte 07,03,03,07,07,13,13,07
// .byte 03,03,03,03,03,13,13,03
// .byte 07,03,03,07,07,13,13,07
// .byte 07,03,03,07,07,13,13,07
// .byte 13,03,03,13,13,13,13,13
// .byte 07,03,03,07,07,13,13,07
// .byte 15,15,15,15,15,15,15,15

// .byte 15,15,15,15,15,15,15,15
// .byte 07,03,07,07,13,03,13,07
// .byte 07,13,07,13,03,07,03,13
// .byte 13,03,13,03,07,13,07,03
// .byte 13,03,13,03,07,13,07,03
// .byte 07,13,07,13,03,07,03,13
// .byte 07,03,07,07,13,03,13,07
// .byte 15,15,15,15,15,15,15,15

// .byte 15,15,15,15,15,15,15,15
// .byte 07,03,03,13,13,03,03,07
// .byte 03,07,03,13,13,03,07,03
// .byte 13,13,13,03,03,13,13,13
// .byte 13,13,13,03,03,13,13,13
// .byte 03,07,03,13,13,03,07,03
// .byte 07,03,03,13,13,03,03,07
// .byte 15,15,15,15,15,15,15,15


s_scrolltext:
.text "                                                           Welcome to Patto's music collection...  An absolutely insane pack featuring 100 sid covers, remixes and arcade quality conversions for your commodore 64."
.text " Listen to tracks from Sonic the Hedgehog, Double Dragon, Strider, Golden Axe, Midnight Resistance and loads more. Enjoy the collection and do check out sidamp.com for the latest releases... and don't forget to vote!"
.text " All music by Patto. Code by Ziggy. Graphics and disk cover by Lobo. Production and sexual favours by Jazzcat."
.text " Greetings fly out to the organisers of SYNTAX, you guys always bring a great weekend of retro computing, modern-day coding, chip music, pixel graphics and diy electronics projects, keeping the aussie scene alive! "
.text " We also salute those in 64ever, Abyss, Algotech, Angels, Arise, Army Of Darkness, Arsenic, Artline Designs, Atlantis, Beyond Force, Bonzai, Booze Design, Camelot, Censor, Chorus, Christopherjam, Chrome, Cosine, Crest, Cydonia, Cygnus Oz, Datadoor, Defame, Dekadence, Digital Access, Disaster Area, Elysium, Excess, Exclusive On, Extend, Fairlight, Finnish Gold, Focus, Genesis Project, Hack N' Trade, Hoaxers, Hokuto Force, Icon64, Laxity, Lepsi De, Level 64, Lft, Mahoney, Maniacs Of Noise, Mayday!, Mdg, Megastyle, Multistyle Labs, Nah-Kolor, No Name, Noice, Nostalgia, Offence, Origo, Oxyron, Padua, Panda Design, Plush, Priorart, Prosonix, Protovision, Psytronik, Pvm, Resource, Rgcd, Role, Samar, Shape, Singular, Starz, Success & TRC, Svenonacid, The Dreams, The Solution, Triad, Trsi, Udi, Unkle K, Vibrants, Vision, WoW, X-Ample And Xenon."
.text " Make sure to get a carrier detect at one of our boards dzbbs.hopto.org, antidote.triad.se, reflections.servebbs.com (port 64128) or to check our other fine releases at onslaught.c64.org "
.text " The collection awaits, Press SPACE and follow me down the PETSCII rabbithole...   "
.byte $00, $00
