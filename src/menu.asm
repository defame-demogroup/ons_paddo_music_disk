/*
Defined in menu_items.asm
.var menu_x = 5
.var menu_y = 10
.var menu_h = 10
.var menu_w = 8
.var item_w = 64

Deifned in sid_include.asm
sid_name.size()

*/
.var keyboard_scanning_delay_frames = 3
.var title_scroll_delay_frames = 5
.var title_scroll_delay_frames_major = 30

m_key_scan_delay:
.byte $00

m_title_scroll_delay_counter:
.byte $10

m_title_scroll_enabled:
.byte $00

m_title_scroll_position:
.byte $05

m_title_scroll_direction:
.byte $00

m_modal_context:
.byte $00

m_modal_ack:
.byte $00

menu_init:
    lda #$00
    sta menu_selected_item
    rts

menu_irq_handler:
    jsr menu_scroll_title
    jsr menu_redraw
    jsr menu_input
    rts

menu_modal:
    lda #$00
    sta m_modal_ack
    lda #$01
    sta m_modal_context
    rts

menu_no_modal:
    lda #$00
    sta m_modal_context
    lda #$00
    sta m_modal_ack
    rts

//-----------------------
//internal functions

menu_scroll_title:
//     lda m_title_scroll_enabled
//     bne !+
//     rts
// !:
    dec m_title_scroll_delay_counter
    beq !+
    rts
!:
    lda #title_scroll_delay_frames
    sta m_title_scroll_delay_counter
    ldx m_title_scroll_position
    lda m_title_scroll_direction
    bne !backwards+
!forwards:
    inx 
    jmp !+
!backwards:
    dex
!:
    cpx #$00
    bne !+
    ldx #$01
    lda #$00
    sta m_title_scroll_direction
    lda #title_scroll_delay_frames_major
    sta m_title_scroll_delay_counter
!:    
    ldy menu_selected_item
    lda menu_title_length,y
    sta m_st_cmp
    cpx m_st_cmp: #32 // for ping pong
    bne !+
    lda #$01
    sta m_title_scroll_direction
    lda #title_scroll_delay_frames_major
    sta m_title_scroll_delay_counter
!:
    stx m_title_scroll_position
    rts

menu_input:
    dec m_key_scan_delay
    beq !+
    rts
!:
    lda #keyboard_scanning_delay_frames
    sta m_key_scan_delay
    clc
    jsr keyboard
    bcc !valid_input+
    lda m_title_scroll_enabled
    bne !+
    lda #$01
    sta m_title_scroll_enabled
    sta m_title_scroll_direction
    lda #$05 //default location
    sta m_title_scroll_position
    lda #title_scroll_delay_frames
    sta m_title_scroll_delay_counter
!:
    rts
!valid_input:
    sta menu_is_space
    lda m_modal_context
beq !+
    lda menu_is_space: #$00
    cmp #$20
    beq !modal_ack+
    cpx #$00
    bne !modal_ack+
    cpy #$00
    bne !modal_ack+
    rts
!modal_ack:
    lda #$01
    sta m_modal_ack
    rts
!:
    lda #$00
    sta m_title_scroll_enabled
    lda #title_scroll_delay_frames
    sta m_title_scroll_delay_counter
    lda #$05 //default location
    sta m_title_scroll_position
    tya 
    and #%00001000
    beq !+ //not home key pressed
!home:
    lda #$00
    sta menu_selected_item
    rts
!:
    /*
    Todo: add some easter eggs in here!
    */
    txa
    and #%00000010
    beq !+ //not return key pressed
!return:
    lda menu_selected_item
    sta menu_chosen_song
    tay
    lda menu_indexes_lo,y
    sta menu_song_ptr
    lda menu_indexes_hi,y
    sta menu_song_ptr + 1
    ldy #$00
    jsr !read_byte+
    sta menu_next_song_disk
    iny
    jsr !read_byte+
    sta menu_next_song_filename_a
    iny
    jsr !read_byte+
    sta menu_next_song_filename_b
    lda #$01
    sta menu_next_song_ready_flag
    rts
!read_byte:
    lda menu_song_ptr: $ffff,y
    rts
!:
    txa
    and #%10000000 //check up/down key
    asl //push key onto carry
    bcs !updown+
    rts
!updown:
    tya 
    and #%01010000 //check shift key to determine direction
    bne !up+
!down:
    ldx menu_selected_item
    cpx #100
    beq !+
    inx
    stx menu_selected_item
!:
    rts

!up:
    ldx menu_selected_item
    cpx #00
    beq !+ 
    dex
    stx menu_selected_item
!:
    rts

menu_redraw:
    /*
    if menu_selected_item < (menu_h/2):
        loop from Y=0, X=0 and draw items
        set selected item index to different color
    elseif menu_selected > (sid_name.size() - menu_h)
        loop from Y=(sid_name.size() - menu_h), X=0
        set selected item index to different color
    else
        loop from Y= menu_selected_item - (menu_h/2), X=0
        set selected item index to different color
    */
    ldx #$00
    lda menu_selected_item
    cmp #(menu_h / 2)
    bcs !+ //if menu_selected_item < (menu_h/2):
        ldy #$00
        jmp !redraw+
!:  cmp #(sid_name.size() - (menu_h/2)) //elseif menu_selected > (sid_name.size() - menu_h)
    bcc !+
        ldy #(sid_name.size() - menu_h)
        jmp !redraw+
!: //else
    sec
    sbc #(menu_h/2)
    tay
!redraw:
    !loop:
        cpy menu_selected_item
        bne !skip+
        lda #$01
        sta menu_item_color_addra
        jsr menu_active_draw_item
        jmp !+
    !skip:
        lda #$0e
        sta menu_item_color_addr
        jsr menu_draw_item
    !:
        inx
        iny
        cpx #menu_h
        bne !loop-
    rts


/*
Y = menu item
X = onscreen menu row
*/
menu_draw_item:
    stx menu_tmp_x
    sty menu_tmp_y
    lda menu_screen_lo,x
    sta menu_screen_addr
    sta menu_color_addr
    lda menu_screen_hi,x
    sta menu_screen_addr + 1
    clc
    adc #$d4 // 04 + d4 = d8 which is color RAM
    sta menu_color_addr + 1
    lda menu_indexes_lo,y
    sta menu_item_addr
    lda menu_indexes_hi,y
    sta menu_item_addr + 1
    ldy #$05
    ldx #$00
!:
    lda menu_item_addr: $ffff,y
    sta menu_screen_addr: $ffff,x
    lda menu_item_color_addr: #$00
    sta menu_color_addr: $ffff,x
    inx
    iny
    cpx #menu_w
    bne !-
    ldx menu_tmp_x: #$00
    ldy menu_tmp_y: #$00
    rts

/*
Y = menu item
X = onscreen menu row
A = scroll offset (of selected item)
*/
menu_active_draw_item:
    stx menu_tmp_xa
    sty menu_tmp_ya
    lda menu_row_sprite_y_locations,x
    sta $d007
    sta $d009
    lda menu_screen_lo,x
    sta menu_screen_addra
    sta menu_color_addra
    lda menu_screen_hi,x
    sta menu_screen_addra + 1
    clc
    adc #$d4 // 04 + d4 = d8 which is color RAM
    sta menu_color_addra + 1
    lda menu_indexes_lo,y
    sta menu_item_addra
    lda menu_indexes_hi,y
    sta menu_item_addra + 1
    ldy m_title_scroll_position
    ldx #$00
!:
    lda menu_item_addra: $ffff,y
    clc
    adc #$80 //reverse
    sta menu_screen_addra: $ffff,x
    lda menu_item_color_addra: #$00
    sta menu_color_addra: $ffff,x
    inx
    iny
    cpx #menu_w
    bne !-
    ldx menu_tmp_xa: #$00
    ldy menu_tmp_ya: #$00
    rts

menu_chosen_song:
    .byte $00

menu_selected_item:
    .byte $00

menu_next_song_filename_a:
    .byte $00

menu_next_song_filename_b:
    .byte $00

menu_next_song_disk:
    .byte $00

menu_next_song_ready_flag:
    .byte $00

menu_row_sprite_y_locations:
.pc=* "menu_row_sprite_y_locations"
.for(var i=0;i<menu_h;i++){
    .byte <($32 + (menu_y * $08) + (i*8))
}
