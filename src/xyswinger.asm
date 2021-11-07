.var xys_height = 16
.var xys_width = 40
.var xys_top = 0
.var xys_bot = xys_top + xys_height
.var xys_logo_height = 25 * 2
.var xys_logo_width = 40 * 3
.var xys_logo_base = $8500

xys:
    ldx xys_index
    lda xys_x_lo,x
    sta xys_x_scroll_reg
    lda xys_y_lo,x
    sta xys_y_scroll_reg
    lda xys_y_hi,x
    tay
    lda xys_rows,y
    tay
    // self modifying code to change the 
    // lookup offset for big logo
    .for(var i = 0;i < xys_height;i++){
        sty xys_blit + 2 + (i * 12)
        sty xys_blit + 8 + (i * 12)
        iny
    }

    ldy #$00
    lda xys_x_hi,x
    tax
    xys_blit:
    .for(var i=0;i<xys_height;i++){
        lda xys_logo_base + (i * $100),x   // 3 bytes
        sta $0400 + (i * $28) + (xys_top * $28),y //3 bytes
        lda xys_logo_base + (i * $100) + $80,x // 3 bytes
        sta $d800 + (i * $28) + (xys_top * $28),y //3 bytes
    }
    inc $d020
    inx
    iny

    /*
    Check if you are doing the fourth 'blit' and if it is, disable VIC
    Did I mention you can't use x or y?
    */
    cpy #$04
    bne !a+
    lda #$ae
!raster:
    cmp $d012
    bne !raster-
!raster:
    cmp $d012
    beq !raster-
    lda $d016
    ora #%00010000
    sta $d016
    lda $d011
    ora #%01100000
    and #%01111111
    sta $d011

    jmp !c+
!a:
    /*
    If you're on the 6th blit, re-enable VIC
    */
    cpy #$06
    bne !b+
    lda $d012
!raster:
    cmp $d012
    beq !raster-
    lda $d011
    and #%00000111 //grab current scroll reg
    sta xys_r_b
    lda #$07 //7 - current scroll value (invert it)
    sec
    sbc xys_r_b: #$00
    //ora #%01100000 // then also set illegal VIC state
    sta xys_r_c

    lda $d012
!raster:
    cmp $d012
    beq !raster-
    lda $d011
    ora xys_r_c: #$00
    and #%00011111 // never write bit 7 hi to $d011 unless you want raster somewhere
    sta $d011
    lda #$c8
    sta $d016
    // lda $d011
    // and #%00011111
    // sta $d011
    jmp !c+

!b:
    cpy #$25
    bne !c+
    lda xys_x_scroll_reg
    sta $d016
    lda xys_y_scroll_reg
    sta $d011
!c:    
    cpy #$28
    beq !+ 
    jmp xys_blit
!:
lda #$00
sta $d020
    inc xys_index
    rts


xys_index:
    .byte $00

xys_y_scroll_reg:
    .byte $00

xys_x_scroll_reg:
    .byte $00


.align $100
.pc=* "xys_rows"
xys_rows:
.for(var i=0;i<xys_logo_height;i++){
    .byte (>xys_logo_base) + i
}


.var xys_x_vals = List()
.var xys_y_vals = List()
.for(var i=0;i<256;i++)
{
    .var w = xys_logo_width - 60
    .var h = xys_height + 1
    .eval xys_x_vals.add(round((((w * 8) + (w * 8 * sin(toRadians(i*720/256))*cos(toRadians(i*360/256)))))) - (20 * 8))
    .eval xys_y_vals.add(round((((h * 8) + (h * 8 * cos(toRadians(i*360/256)))))))
}

.align $100
xys_x_hi:
.for(var i=0;i<256;i++)
{
    .byte (xys_x_vals.get(i) / 8)
}
.align $100
xys_x_lo:
.for(var i=0;i<256;i++)
{
    .byte 7 - (xys_x_vals.get(i) & %00000111) + $c0
}

.align $100
xys_y_hi:
.for(var i=0;i<256;i++)
{
    .byte (xys_y_vals.get(i) / 8)
}

.align $100
xys_y_lo:
.for(var i=0;i<256;i++)
{
    .byte 7 - (xys_y_vals.get(i) & %00000111) + $10
}

