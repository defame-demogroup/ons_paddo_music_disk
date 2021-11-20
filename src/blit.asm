
blit_save:
    ldx #$00
!:
    .for(var i=0; i<4; i++){
        lda [$0400 + (i * $100)] ,x
        sta [blit_buf + (i * $100)] ,x
        lda [$d800 + (i * $100)] ,x
        sta [blit_buf + $0400 + (i * $100)] ,x
    }
    inx
    bne !-
    rts

blit_load:
    ldx #$00
!:
    .for(var i=0; i<4; i++){
        lda [blit_buf + (i * $100)] ,x
        sta [$0400 + (i * $100)] ,x
        lda [blit_buf + $0400 + (i * $100)] ,x
        sta [$d800 + (i * $100)] ,x
    }
    inx
    bne !-
    rts

blit_buf:
.fill $800, $00
