/*
---------------
Spinner Handler
---------------
*/
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
