.var menu_x = 2
.var menu_y = 3
.var menu_h = 20
.var menu_w = 11
.var item_w = 50

menu_screen_lo:
.pc=* "menu_screen_lo"
.for(var i=0;i<menu_h;i++){
    .byte <($0400 + (menu_y * $28) + menu_x + (i * $28))
}

menu_screen_hi:
.pc=* "menu_screen_hi"
.for(var i=0;i<menu_h;i++){
    .byte >($0400 + (menu_y * $28) + menu_x + (i * $28))
}

menu_title_length:
.pc=* "menu_title_length"
.for(var i=0;i<sid_name.size();i++){
    .var title = sid_name.get(i)
    .var index = title.size() - 1
    .while((title.charAt(index) == ' ') && (index > 0)){
        .eval index--
    }
    .if(index < menu_w + 3){
        .eval index = menu_w + 3
    }
    .byte index - menu_w + 2
}

.align $100
.pc=* "menu_indexes_lo"
menu_indexes_lo:
.for(var i=0;i<sid_name.size();i++){
    .byte <(menu_items + (i * 64))
}

.align $80
.pc=* "menu_indexes_hi"
menu_indexes_hi:
.for(var i=0;i<sid_name.size();i++){
    .byte >(menu_items + (i * 64))
}

.align $100
.pc=* "menu_items"
menu_items:    
.for(var i=0;i<sid_name.size();i++){
    .align $40
    .byte sid_disk.get(i)
    .for(var j=0;j<63;j++){
        .if(j < sid_name.get(i).size()){
            .byte sid_name.get(i).toLowerCase().charAt(j)

        } else {
            .byte $20
        }
    }
}
