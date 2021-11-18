/*
Elapsed time
*/
tt_frame_count:
.byte $00

tt_seconds:
.byte $00, $00

tt_minutes:
.byte $00, $00

tt_hours:
.byte $00, $00

.var tt_tod_y = 10
.var tt_tod_x = 10
.var tt_tod_start = $0400 + ($28 * tt_tod_y) + tt_tod_x

.var tt_title_y = 11
.var tt_title_x = 10
.var tt_title_start = $0400 + ($28 * tt_title_y) + tt_title_x


//call this to render the current elapsed play time
tt_render_tod:
    ldx #$00
    lda tt_hours
    jsr tt_out
    lda tt_hours + 1
    jsr tt_out
    lda #':'
    sta tt_tod_start,x
    inx
    lda tt_minutes
    jsr tt_out
    lda tt_minutes + 1
    jsr tt_out
    lda #':'
    sta tt_tod_start,x
    inx
    lda tt_seconds
    jsr tt_out
    lda tt_seconds + 1
    jsr tt_out
    rts

tt_out:
    clc
    adc #$30
    sta tt_tod_start,x
    inx
    rts

//call this in IRQ once per screen update
tt_calculate_tick:
    dec tt_frame_count
    beq !+
    rts
!: 
    lda #50
    sta tt_frame_count
    inc tt_seconds + 1
    lda tt_seconds + 1
    cmp #$0a
    beq !+
    rts
!:
    lda #$00
    sta tt_seconds + 1
    inc tt_seconds
    lda tt_seconds
    cmp #$06
    beq !+
    rts
!:
    lda #$00
    sta tt_seconds
    inc tt_minutes + 1
    lda tt_minutes + 1
    cmp #$0a
    beq !+
    rts
!:
    lda #$00
    sta tt_minutes + 1
    inc tt_minutes
    lda tt_minutes
    cmp #$06
    beq !+
    rts
!:
    lda #$00
    sta tt_minutes
    inc tt_hours + 1
    lda tt_hours + 1
    cmp #$0a
    beq !+
    rts
!:
    lda #$00
    sta tt_hours + 1
    inc tt_hours
    lda tt_hours
    cmp #$0a
    beq !+
    rts
!:
    lda #$00
    sta tt_hours
    rts

//call this to reset the clock
tt_reset_clock:
    lda #$00
    sta tt_frame_count
    sta tt_seconds
    sta tt_seconds + 1
    sta tt_minutes
    sta tt_minutes + 1
    sta tt_hours
    sta tt_hours + 1
    rts

//render title 
tt_render_title:
    ldy menu_selected_item
    lda menu_indexes_lo,y
    sta tt_item_addr
    lda menu_indexes_hi,y
    sta tt_item_addr + 1
    ldy #$01
    ldx #$00
!:
    lda tt_item_addr: $ffff,y
    sta tt_title_start,x
    inx
    iny
    cpx #menu_w
    /*
    TODO: deal with word wrapping!
    */
    bne !-
    rts