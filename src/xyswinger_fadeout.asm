
xys_fadeout:
    ldx #$00
    clc
!loop:
    .for(var i = 0;i < xys_logo_height;i++){
        lda #$0
        sta xys_logo_base + (i * $100) + $80,x

        lda xys_logo_base + (i * $100) + $81,x
        adc #$20
        tay 
        lda xys_clut,y
        sta xys_logo_base + (i * $100) + $81,x

        lda xys_logo_base + (i * $100) + $82,x
        adc #$10
        tay 
        lda xys_clut,y
        sta xys_logo_base + (i * $100) + $82,x

        lda xys_logo_base + (i * $100) + $83,x
        adc #$00
        tay 
        lda xys_clut,y
        sta xys_logo_base + (i * $100) + $83,x
    }
    inx
    cpx #xys_logo_width + 4
    beq !+
    /*
    Todo - fade out volume
    */
    jmp !loop-
!:  rts


/*
Stolen from SA2019 invite demo, used originally for
bitmaps. Now we use for text colormap fadeout...
http://www.aaronbell.com/secret-colours-of-the-commodore-64/
*/
.struct ColorBlend{originalColor, highColor,midColor,lowColor}
.var colorSubs = List(16)
.eval colorSubs.set(0,ColorBlend(0,0,0,0))
.eval colorSubs.set(1,ColorBlend(1,15,12,11))
.eval colorSubs.set(2,ColorBlend(2,9,6,0))
.eval colorSubs.set(3,ColorBlend(3,12,4,6))
.eval colorSubs.set(4,ColorBlend(4,11,6,0))
.eval colorSubs.set(5,ColorBlend(5,8,9,0))
.eval colorSubs.set(6,ColorBlend(6,6,0,0))
.eval colorSubs.set(7,ColorBlend(7,10,8,2))
.eval colorSubs.set(8,ColorBlend(8,11,9,0))
.eval colorSubs.set(9,ColorBlend(9,9,0,0))
.eval colorSubs.set(10,ColorBlend(10,8,9,0))
.eval colorSubs.set(11,ColorBlend(11,11,9,0))
.eval colorSubs.set(12,ColorBlend(12,8,11,9))
.eval colorSubs.set(13,ColorBlend(13,3,14,6))
.eval colorSubs.set(14,ColorBlend(14,4,11,6))
.eval colorSubs.set(15,ColorBlend(15,12,11,6))

.align $10
xys_clut:
.for(var i=0;i<$10;i++){
    .byte (colorSubs.get(i)).highColor
}
.for(var i=0;i<$10;i++){
    .byte (colorSubs.get(i)).midColor
}
.for(var i=0;i<$10;i++){
    .byte (colorSubs.get(i)).lowColor
}
