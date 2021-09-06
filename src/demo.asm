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
.pc=* "Exomizer"
.import source "exo.asm"
.pc=* "RLE Depacker"
.import source "rle_depacker.asm"
.pc=* "IRQ Loader"
.import source "loader_load.asm"
keyboard:
.pc=* "keyboard handler"
.import source "keyboard.asm"
.pc = * "Main DEMO"
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
    lda #$15
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
    lda #$36
    sta $01
    cli  

    load($30,$30,$c000) //00.prg
    jsr exo_exo
    load(70,70,$c000) //ff.prg 
    jsr exo_exo

    ldx #<txt_onslogo_only
    ldy #>txt_onslogo_only
    jsr upk_set_txt
    ldx #<col_onslogo_only
    ldy #>col_onslogo_only
    jsr upk_set_col
    jsr upk_unpack

!:
    jmp !-
    rts    


.pc=* "event handlers"
press_space:
    jsr keyboard
    bcs press_space
    cmp #$20
    beq !finish+
    jmp press_space
!finish:
    rts


/*
Interrupt Handler
*/
.pc=* "irq"
irq:
    lda #$ff 
    sta $d019
    jmp $ea31  
    
.pc=* "Petscii"
.import source "petscii_include.asm"
