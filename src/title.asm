/*
Song Title Module
*/


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

.var tt_tod_y = 22
.var tt_tod_x = 22
.var tt_tod_start = $0400 + ($28 * tt_tod_y) + tt_tod_x

.var tt_title_y = 18
.var tt_title_x = 18
.var tt_title_start = $0400 + ($28 * tt_title_y) + tt_title_x
.var tt_title_second = $0400 + ($28 * (tt_title_y + 1)) + tt_title_x + 4
.var tt_title_third = $0400 + ($28 * (tt_title_y + 2)) + tt_title_x + 4
.var tt_title_fourth = $0400 + ($28 * (tt_title_y + 3)) + tt_title_x + 4
.var tt_box_w = 16 + 1 + 1
.var tt_sub_w = tt_box_w - 4 // column indent

tt_reset:
    jmp tt_reset_clock

tt_run:
    jsr tt_calculate_tick
    jmp tt_render_tod

//call this to render the current elapsed play time
tt_render_tod:
    ldx #$00
    lda tt_hours
    jsr tt_out
    lda tt_hours + 1
    jsr tt_out
    lda #(':' + $80)
    sta tt_tod_start,x
    inx
    lda tt_minutes
    jsr tt_out
    lda tt_minutes + 1
    jsr tt_out
    lda #(':' + $80)
    sta tt_tod_start,x
    inx
    lda tt_seconds
    jsr tt_out
    lda tt_seconds + 1
    jsr tt_out
    rts

tt_out:
    clc
    adc #($30 + $80) 
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
    sta tt_seconds
    sta tt_seconds + 1
    sta tt_minutes
    sta tt_minutes + 1
    sta tt_hours
    sta tt_hours + 1
    lda #50
    sta tt_frame_count
    rts

//render title 
tt_render_title:
    ldy menu_chosen_song
    lda menu_indexes_lo,y
    sta tt_item_addr
    lda menu_indexes_hi,y
    sta tt_item_addr + 1
    // word wrap! 
    ldy #tt_box_w
!loop:
    dey
    jsr !read_title+ 
    cmp #' ' //space - I can guarantee I always have at least one space before I hit $ff so this will never infinite loop!
    bne !loop-
    sty tt_wrap1
    tya
    clc
    adc #tt_sub_w
    tay
!loop:
    dey
    cpy tt_wrap1
    beq !reset_wrap+
    jsr !read_title+ 
    cmp #' ' //space - I can guarantee I always have at least one space before I hit $ff so this will never infinite loop!
    bne !loop-
    jmp !skip+
!reset_wrap:
    ldy #tt_sub_w
!skip:
    sty tt_wrap2

    tya
    clc
    adc #tt_sub_w
    tay
!loop:
    dey
    cpy tt_wrap2
    beq !reset_wrap+
    jsr !read_title+ 
    cmp #' ' //space - I can guarantee I always have at least one space before I hit $ff so this will never infinite loop!
    bne !loop-
    jmp !skip+
!reset_wrap:
    ldy #tt_sub_w
!skip:
    sty tt_wrap3

    tya
    clc
    adc #tt_sub_w
    tay
!loop:
    dey
    cpy tt_wrap3
    beq !reset_wrap+
    jsr !read_title+ 
    cmp #' ' //space - I can guarantee I always have at least one space before I hit $ff so this will never infinite loop!
    bne !loop-
    jmp !skip+
!reset_wrap:
    ldy #tt_sub_w
!skip:
    sty tt_wrap4



    ldy #$01
    ldx #$00
!loop:
    jsr !read_title+
    clc
    adc #$80
    sta tt_title_start,x
    inx
    iny
    cpy tt_wrap1: #00
    bne !loop-
    iny
    lda #' ' + $80
!fill:
    cpx #tt_box_w - 2
    bcs !done+
    sta tt_title_start,x
    inx
    jmp !fill-
!done:
    ldx #$00
!loop:
    jsr !read_title+
    clc
    adc #$80
    sta tt_title_second,x
    inx
    iny
    cpy tt_wrap2: #00
    bne !loop-
    iny
    lda #' ' + $80
!fill:
    cpx #tt_sub_w - 2
    bcs !done+
    sta tt_title_second,x
    inx
    jmp !fill-
!done:
    ldx #$00
!loop:
    jsr !read_title+
    clc
    adc #$80
    sta tt_title_third,x
    inx
    iny
    cpy tt_wrap3: #00
    bne !loop-
    iny
    lda #' ' + $80
!fill:
    cpx #tt_sub_w - 2
    bcs !done+
    sta tt_title_third,x
    inx
    jmp !fill-
!done:
    ldx #$00

!loop:
    jsr !read_title+
    clc
    adc #$80
    sta tt_title_fourth,x
    inx
    iny
    cpy tt_wrap4: #00
    bne !loop-
    lda #' ' + $80
!fill:
    cpx #tt_sub_w - 2
    bcs !skip+
    sta tt_title_fourth,x
    inx
    jmp !fill-
!skip:
    rts

!read_title:
    lda tt_item_addr: $ffff,y
    rts

