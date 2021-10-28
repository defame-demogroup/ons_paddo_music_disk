.var xys_height = 10
.var xys_width = 40
.var xys_top = 0
.var xys_bot = xys_top + xys_height
.var xys_logo_height = 100
.var xys_logo_width = 100
.var xys_logo_base = $1000

xys:
ldx xys_index
lda xys_x_lo,x
sta xys_x_scroll_reg
lda xys_y_lo,x
sta xys_y_scroll_reg
lda xys_y_hi,x
tay
.for(var i = 0;i < xys_height;i++){
    lda xys_rows,y
    sta xys_blit + 2 + (i * 7)
    iny
}
// ldy #$00
lda xys_x_hi,x
tax
xys_blit:
.for(var i=0;i<xys_height;i++){
    .for(var j=0;j<xys_width;j++){
        // lda (xys_logo_base + (i * $100)),x
        // sta ($0400 + (i * $28) + (xys_top * $28)),y
        lda[xys_logo_base + (i * $100) + j],x
        sta[$0400 + (i * $28) + (xys_top * $28) + j]
    }
}
inc xys_index
rts


xys_index:
    .byte $00

xys_y_scroll_reg:
    .byte $00

xys_x_scroll_reg:
    .byte $00


.align $100
xys_rows:
.for(var i=0;i<xys_logo_height;i++){
    .byte (>xys_logo_base + i)
}

.var xys_x_vals = List()
.var xys_y_vals = List()
.for(var i=0;i<256;i++)
{
    .eval xys_x_vals.add(round((xys_logo_width * 8 / 2) + (xys_logo_width * 8)*sin(toRadians(i*360/256)) * sin(toRadians(i*720/256))*cos(toRadians(i*1440/256))))
    .eval xys_y_vals.add(round((xys_logo_height * 8 / 2) + (xys_logo_height * 8)*sin(toRadians(i*360/256)) * sin(toRadians(i*720/256))*cos(toRadians(i*1440/256))))
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

