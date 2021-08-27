/*
Demo Sourcecode

Memory map:
$0800         : BASIC start
$0ff0 - $3000 : Music Buffer
$3000 - $5000 : Petscii Buffer
$5000 - $C000 : Code
$C000 - $D000 : Load Buffer

*/
.import source "petscii_addresses.asm"

BasicUpstart2(start)

* = $0f00 "Music Buffer"
loader_init:
.import source "loader_init.asm"

* = $3000 "PETSCII Animation Buffers"
.fill $2000, $00
* = $5000 "Code"
start:
    lda #$00
    sta $d020
    sta $d021
    jsr loader_init
    rts    

.import source "loader_load.asm"
.import source "keyboard.asm"
.import source "rle_depacker.asm"
.import source "petscii_include.asm"
