
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
    /*
    todo:  read data from GoatTrack registers 
    reset player UI here! 
    */
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
    /*
    todo:  read data from GoatTrack registers 
    and update the UI here! 
    */
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
