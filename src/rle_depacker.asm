
.align $100
/************************************************
Run equal-byte unpack (Screen)
    x: source data lo-byte
    y: source data hi-byte
    a: destination hi-byte
*************************************************/
upk:
	stx upk_src + 1
	sty upk_src + 2
	sta upk_dst + 2
	lda #$00
	sta upk_dst + 1
	jsr upk_read
	sta upk_sentinel + 1 // this is the sentinel char

upk_unpack:
// main loop checks for RLE sentinels and unpacks
upk_loop:
	jsr upk_read
upk_sentinel:
	cmp #$00
	beq upk_unrle
	jsr upk_write
	jmp upk_loop

//screenmem unpacker
upk_unrle:
    // hi byte depack count
	jsr upk_read
	tay // hi byte
	cpy #$ff  // if it's $ff on the high byte that means the file is done.
	beq upk_finish
	jsr upk_read
	tax // lo byte
	jsr upk_read //byte to write
upk_ip_loop:
	jsr upk_write
	dex
	cpx #$00
	bne upk_ip_loop
	cpy #$00
	beq upk_loop
	dey
	jmp upk_ip_loop
upk_finish:
    rts

/*************************************************
Enable transparency logic during unpack
    a: transparent byte
*************************************************/
upk_enable_transparency:
	sta upk_w_trans_enable + 1
	lda #$c9
	sta upk_w_trans_enable
	lda #$f0
	sta upk_w_trans_enable + 2
	lda #$03
	sta upk_w_trans_enable + 3
	rts

/*************************************************
Disable transparency logic during unpack
*************************************************/
upk_disable_transparency:
	lda #$ea
	sta upk_w_trans_enable
	sta upk_w_trans_enable + 1
	sta upk_w_trans_enable + 2
	sta upk_w_trans_enable + 3
	rts


/*
Functions
*/
upk_read:
upk_src:
	lda $ffff
	inc upk_src + 1
	bne !+
	inc upk_src + 2
!:	rts

upk_write:
upk_w_trans_enable:
	cmp #$66
	beq upk_w_trans
upk_dst:	
	sta $ffff
upk_w_trans:
	inc upk_dst + 1
	bne !+
	inc upk_dst + 2
!:	rts

