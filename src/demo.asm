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
.import source "sid_include.asm"

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
    sei
    jsr loader_init
    cli
    lda #$00
    sta $d020
    sta $d021
    jsr $e544 // clear screen
    lda#$17
    sta $d018	
    lda#$80
    sta $0291
    sei             
    lda #$7f       // Disable CIA
    sta $dc0d
    lda $d01a      // Enable raster interrupts
    ora #$01
    sta $d01a
    lda $d011      // High bit of raster line cleared, we're
    and #$7f       // only working within single byte ranges
    sta $d011
    lda #$01    // We want an interrupt at the top line
    sta $d012
    lda #<irq    
    sta $0314    
    lda #>irq
    sta $0315
    cli  

    load(30,30,$c000) //00.prg



    rts    

/*
Interrupt Handler
*/
.pc=* "irq"
irq:
    lda #$ff 
    sta $d019
    jmp $ea31  
    

.import source "loader_load.asm"
.import source "keyboard.asm"
.import source "rle_depacker.asm"
.import source "petscii_include.asm"
.import source "exo.asm"
