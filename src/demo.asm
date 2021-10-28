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
.import source "petscii_include.asm"


.segment xys_routine [outPrg="xys.prg"]
*=$8000
.import source "xyswinger.asm"

.segment demo_main [outPrg="demo.prg"]
*=$0801
BasicUpstart2(start)
.pc=$0f00 "Music Buffer"
loader_init:
.import source "loader_init.asm"
.var music_song = $0f00
.var music_speed = $0f01
.var music_init = $0f02
.var music_play = $0f04

.pc=$3000 "PETSCII Animation Buffers"

.pc=$5000 "Code"
.pc=* "Exomizer"
.import source "exo.asm"

.pc=* "RLE Depacker"
.import source "rle_depacker.asm"

.pc=* "IRQ Loader"
.import source "loader_load.asm"

.pc=* "keyboard handler"
keyboard:
.import source "keyboard.asm"

.pc=* "Scroller"
.import source "scroller.asm"

.pc = * "Main DEMO"
start:
    lda #$00
    sta $d020
    sta $d021
    lda #$00
    sta $d020
    sta $d021
    jsr $e544 // clear screen
    lda #$15
    sta $d018	
    lda#$80
    sta $0291
    //have to init scroller after clearing the screen!
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
    lda #<irq_loader 
    sta $0314    
    lda #>irq_loader
    sta $0315
    lda #$36
    sta $01
    cli  

/*
LOADING SPINNER
*/
    inc enable_effect

    jsr loader_init

    load($30,$31,$c000) //01.prg
    jsr m_disable
    jsr exo_exo
    jsr m_reset

    //this is how we load screens - todo - load the data
    load(70,70,$c000) //ff.prg
    jsr exo_exo

    //this is how we load screens
    load(64,65,$c000) //ab.prg
    jsr exo_exo

    jsr upk_disable_transparency

    dec enable_effect

    // ldx #<txt_onslogo_only
    // ldy #>txt_onslogo_only
    // lda #$04
    // jsr upk
    // ldx #<col_onslogo_only
    // ldy #>col_onslogo_only
    // lda #$d8
    // jsr upk

    //dec enable_effect
    jsr $e544 // clear screen

    jsr s_init
!:
    jmp !-




/*
steps:
1. show loading text and spinner
2. load intro assets and exo 
3. run intro IRQ and wait for space
4. load player base assets and first song
5. run intro animations 
    -> scroll
    -> tile mover
    -> logo x+y swinger
6. main loop: 
    run animation frames 
    ? load new assets and exo (based on timing - screen updated)
    handle keyboard -> render UI actions -> load new assets and exo (music changes)
    irq: play music, poll keyboard, update player status
*/

/*
    //this is how we load songs!
    load($30,$31,$c000) //00.prg
    jsr m_disable
    jsr exo_exo
    jsr m_reset

    //this is how we load screens
    load(73,73,$c000) //ii.prg
    jsr exo_exo
    jsr upk_disable_transparency
    ldx #<txt_playe
    ldy #>txt_playe
    lda #$04
    jsr upk
    ldx #<col_playe
    ldy #>col_playe
    lda #$d8
    jsr upk

    load(69,69,$c000) //ee.prg 
    jsr exo_exo

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls1
    ldy #>txt_moreskulls1
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls1
    ldy #>col_moreskulls1
    lda #$d8
    jsr upk


anim_start:
    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls1
    ldy #>txt_moreskulls1
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls1
    ldy #>col_moreskulls1
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls2
    ldy #>txt_moreskulls2
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls2
    ldy #>col_moreskulls2
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls3
    ldy #>txt_moreskulls3
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls3
    ldy #>col_moreskulls3
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls4
    ldy #>txt_moreskulls4
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls4
    ldy #>col_moreskulls4
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls5
    ldy #>txt_moreskulls5
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls5
    ldy #>col_moreskulls5
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls6
    ldy #>txt_moreskulls6
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls6
    ldy #>col_moreskulls6
    lda #$d8
    jsr upk

    lda #$a0
    jsr upk_enable_transparency
    ldx #<txt_moreskulls7
    ldy #>txt_moreskulls7
    lda #$04
    jsr upk

    lda #$00
    jsr upk_enable_transparency
    ldx #<col_moreskulls7
    ldy #>col_moreskulls7
    lda #$d8
    jsr upk

    jmp anim_start
    rts    
*/

.pc=* "event handlers"
press_space:
    jsr keyboard
    bcs press_space
    cmp #$20
    beq !finish+
    jmp press_space
!finish:
    rts

enable_music:
.byte $00

enable_effect:
.byte $00

/*
-----------------
Interrupt Handler
-----------------
*/
.pc=* "irq"
//fancy intro IRQ!
irq_loader:
    lda enable_effect
    beq !+
    jsr spinner_run
!:
    lda #$ff 
    sta $d019
    jmp $ea31  

irq_intro:
    jsr s_scroll
    lda #$ff 
    sta $d019
    jmp $ea31  

//standard irq
irq_a:
    jsr m_play
    /*
    todo:  read data from GoatTrack registers 
    and update the UI here! 
    */
    lda #$c0
    sta $d012
    lda #$ff 
    sta $d019
    jmp $ea31  

//multispeed irq
irq_b:
    lda music_speed
    cmp #$ff //multispeed flag from SID
    bne !+
    jsr m_play
!: 
    lda #$00
    sta $d012
    lda #$ff 
    sta $d019
    jmp $ea31  


/*
-------------
Music Handler
-------------
*/
m_disable:
    // todo: fade? at least kill $d418 and stop playing
    lda #$00
    sta $d418
    sta enable_music
    rts

m_reset:
    //set init vector
    lda music_init
    sta !addr_init+ + 1
    lda music_init + 1
    sta !addr_init+ + 2
    //set play vector
    lda music_play
    sta !addr_play+ + 1
    lda music_play + 1
    sta !addr_play+ + 2
    //reset shadow regs
    ldx #$00
    lda #$00
!:
    sta m_shadow,x
    inx
    cpx #$10
    bne !-
    //init SID
    lda music_song
!addr_init:
    jsr $1000
    //enable players
    lda #$01
    sta enable_music
    rts

m_play:
    lda enable_music
    beq !skip+
    ldx #$00
!:
    lda $f0,x
    sta m_shadow,x
    inx
    cpx #$10
    bne !-
!addr_play:
    jsr $1003
    ldx #$00
!:
    lda m_shadow,x
    sta $f0,x
    inx
    cpx #$10
    bne !-
!skip:
    rts

.align $100
m_shadow:
    .fill $100, $00

.pc = * "spinner"
.align $100
.import source "spinner_include.asm"

spinner_reset_txt:
.byte >spinner1_txt
spinner_reset_col:
.byte >spinner1_col
spinner_current:
.byte $00
spinner_delay:
.byte $04

spinner_run:
    dec spinner_delay
    beq !+
    rts
!:  lda #$04
    sta spinner_delay
    lda spinner_current
    cmp #$08
    bne !no_reset+
    lda #$00
    sta spinner_current
    lda spinner_reset_txt
    sta spinner_txt_ptr + 1
    lda spinner_reset_col
    sta spinner_col_ptr + 1
!no_reset:
    ldx #$00
!:
    lda spinner_txt_ptr: spinner1_txt,x
    sta ($0400 + ($28 * 8)),x
    lda spinner_col_ptr: spinner1_col,x
    sta ($d800 + ($28 * 8)),x
    inx
    cpx #(40 * 6)
    bne !-
    inc spinner_current
    inc spinner_col_ptr + 1
    inc spinner_txt_ptr + 1
    inc spinner_col_ptr + 1
    inc spinner_txt_ptr + 1
    rts
