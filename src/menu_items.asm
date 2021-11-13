.var menu_x = 5
.var menu_y = 10
.var menu_h = 10
.var menu_w = 8
.var item_w = 64

.align $100 
menu_screen_lo:
.for(var i=0;i<menu_h){
    .byte <($0400 + (menu_y * $28) + menu_x + (i * $28))
}

.align $10
menu_screen_hi:
.for(var i=0;i<menu_h){
    .byte >($0400 + (menu_y * $28) + menu_x + (i * $28))
}

.align $100
menu_indexes_lo:
.for(var i=0;i<sid_name.size();i++){
    .byte <(menu_items + (i * 64))
}

.align $80
menu_indexes_hi:
.for(var i=0;i<sid_name.size();i++){
    .byte >(menu_items + (i * 64))
}

.align $100
menu_items:    
.for(var i=0;i<sid_name.size();i++){
    .byte sid_disk.get(i)
    .for(var j=0;j<63;j++){
        .if(j >= sid_name.get(i).size()){
            .byte $20
        } else {
            .byte sid_name.get(i).charAt(j)
        }
    }
}
