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
    inx
    iny
    cpy #$28
    beq !+ 
    jmp xys_blit
!:
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
    .var w = xys_logo_width - 40
    .var h = xys_logo_height - 25
    .eval xys_x_vals.add(round(((w * 8 / 2) + (((w + 1)/2) * 8)*sin(toRadians(i*1440/256)))))
    .eval xys_y_vals.add(round((((h * 1.1 * 8) + (h * 1.1 * 8 * cos(toRadians(i*360/256)))))))
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
    .byte (xys_x_vals.get(i) & %00000111)
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
    .byte (xys_y_vals.get(i) & %00000111)
}

