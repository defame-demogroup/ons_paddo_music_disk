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

menu_init:
    lda #$00
    sta menu_selected_item
    rts

menu_up:
    //todo: up one

menu_down:
    //todo: down one

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
        lda #$00
        cpy menu_selected_item
        bne !skip+
        lda #$01
    !skip:
        sta menu_item_color_addr
        lda #$05 //TODO: update when idle, reset when moved
        jsr menu_draw_item
        inx
        iny
        cpx #menu_h
        bne !loop-
    rts


/*
Y = menu item
X = onscreen menu row
A = scroll offset (of selected item)
*/
menu_draw_item:
    stx menu_tmp_x
    sty menu_tmp_y
    sta menu_tmp_addr
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
    lda menu_tmp_addr: #$00
    tay
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

menu_selected_item:
    .byte $00

menu_idle_state:
    .byte $00
