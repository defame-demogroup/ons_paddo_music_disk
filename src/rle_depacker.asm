

/************************************************
Set up equal-byte unpack (Screen)
    x: source data lo-byte
    y: source data hi-byte
*************************************************/
upk_set_txt:
	stx upk_txt_src + 1
	sty upk_txt_src + 2
    lda #$04
	sta upk_txt_dst + 2
	lda #$00
	sta upk_txt_dst + 1
	jsr upk_txt_read
	sta upk_txt_sentinel + 1 // this is the sentinel char
    //reset self-modifying code here
    lda #$20
    sta upk_txt_loop
    lda #<upk_txt_read
    sta upk_txt_loop + 1
    lda #>upk_txt_read
    sta upk_txt_loop + 2
    rts
    

/************************************************
Set up equal-byte unpack (Colormap)
    x: source data lo-byte
    y: source data hi-byte
*************************************************/
upk_set_col:
	stx upk_col_src + 1
	sty upk_col_src + 2
	lda #$00
	sta upk_col_dst + 1
    lda #$d8
	sta upk_col_dst + 2
	jsr upk_col_read
	sta upk_col_sentinel + 1 // this is the sentinel char
    //reset self-modifying code here
    lda #$20
    sta upk_col_loop
    lda #<upk_col_read
    sta upk_col_loop + 1
    lda #>upk_col_read
    sta upk_col_loop + 2
    rts

/*************************************************
Self-modifying code fragments
*************************************************/
upk_finish_semaphore:
    .byte $00

/*************************************************
Perform unpack (screen and colormap at once)
*************************************************/
upk_unpack:
upk_txt_loop:
	jsr upk_txt_read
upk_txt_sentinel:
	cmp #$00
	beq upk_txt_unpack
	jsr upk_txt_write

upk_col_loop:
	jsr upk_col_read
upk_col_sentinel:
	cmp #$00
	beq upk_col_unpack
	jsr upk_col_write
	jmp upk_unpack

upk_txt_unpack:
	jsr upk_txt_read
	tay // hi byte
	cpy #$ff
	beq upk_txt_finish
	jsr upk_txt_read
	tax // lo byte
	jsr upk_txt_read //byte to write
upk_txt_ip_loop:
	jsr upk_txt_write
	dex
	cpx #$00
	bne upk_txt_ip_loop
	cpy #$00
	beq upk_col_loop
	dey
	jmp upk_txt_ip_loop
upk_txt_finish:
    lda upk_finish_semaphore
    bne upk_actual_end
    inc upk_finish_semaphore
    lda #$4c //JMP... the following code rewrites the depacker to no longer depack text
    sta upk_txt_loop
    lda #<upk_col_loop
    sta upk_txt_loop + 1
    lda #>upk_col_loop
    sta upk_txt_loop + 2
    jmp upk_unpack

upk_col_unpack:
	jsr upk_col_read
	tay // hi byte
	cpy #$ff
	beq upk_col_finish
	jsr upk_col_read
	tax // lo byte
	jsr upk_col_read //byte to write
upk_col_ip_loop:
	jsr upk_col_write
	dex
	cpx #$00
	bne upk_col_ip_loop
	cpy #$00
	beq upk_txt_loop
	dey
	jmp upk_col_ip_loop
upk_col_finish:
    lda upk_finish_semaphore
    bne upk_actual_end
    inc upk_finish_semaphore
    lda #$4c //JMP... the following code rewrites the depacker to no longer depack color
    sta upk_col_loop
    lda #<upk_txt_loop
    sta upk_col_loop + 1
    lda #>upk_txt_loop
    sta upk_col_loop + 2
    jmp upk_unpack

upk_actual_end:
    rts
/*************************************************
Enable transparency logic during unpack
    a: transparent byte
*************************************************/
upk_txt_enable_transparency:
	sta upk_txt_w_trans_enable + 1
	lda #$c9
	sta upk_txt_w_trans_enable
	lda #$f0
	sta upk_txt_w_trans_enable + 2
	lda #$03
	sta upk_txt_w_trans_enable + 3
	rts

/*************************************************
Disable transparency logic during unpack
*************************************************/
upk_txt_disable_transparency:
	lda #$ea
	sta upk_txt_w_trans_enable
	sta upk_txt_w_trans_enable + 1
	sta upk_txt_w_trans_enable + 2
	sta upk_txt_w_trans_enable + 3
	rts

/*************************************************
Enable transparency logic during unpack
    a: transparent byte
*************************************************/
upk_col_enable_transparency:
	sta upk_col_w_trans_enable + 1
	lda #$c9
	sta upk_col_w_trans_enable
	lda #$f0
	sta upk_col_w_trans_enable + 2
	lda #$03
	sta upk_col_w_trans_enable + 3
	rts

/*************************************************
Disable transparency logic during unpack
*************************************************/
upk_col_disable_transparency:
	lda #$ea
	sta upk_col_w_trans_enable
	sta upk_col_w_trans_enable + 1
	sta upk_col_w_trans_enable + 2
	sta upk_col_w_trans_enable + 3
	rts

/*
Functions
*/
upk_txt_read:
upk_txt_src:
	lda $ffff
	inc upk_txt_src + 1
	bne !+
	inc upk_txt_src + 2
!:	rts

upk_col_read:
upk_col_src:
	lda $ffff
	inc upk_col_src + 1
	bne !+
	inc upk_col_src + 2
!:	rts


.align $100
.pc = * "DEBUG"

upk_txt_write:
upk_txt_w_trans_enable:
	cmp #$66
	beq upk_txt_w_trans
upk_txt_dst:	
	sta $ffff
upk_txt_w_trans:
	inc upk_txt_dst + 1
    lda upk_txt_dst + 1
	bne !+
	inc upk_txt_dst + 2
!:	rts

upk_col_write:
upk_col_w_trans_enable:
	cmp #$66
	beq upk_col_w_trans
upk_col_dst:	
	sta $ffff
upk_col_w_trans:
	inc upk_col_dst + 1
	lda upk_col_dst + 1
	bne !+
	inc upk_col_dst + 2
!:	rts
