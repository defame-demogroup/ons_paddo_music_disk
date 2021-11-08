.macro ldaStaMany(value, address, quantity, step){
    lda #value
    .for(var i=0;i<quantity;i+=step){
        sta address + i
    }
}
