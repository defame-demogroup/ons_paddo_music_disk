/*
Demo Sourcecode
*/
BasicUpstart2(start)
start:
* = $1000
    lda #$00
    sta $d020
    sta $d021
    rts
    
.import source "petscii_include.asm"
