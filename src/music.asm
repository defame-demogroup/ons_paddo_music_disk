
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
    sta m_addr_init 
    lda music_init + 1
    sta m_addr_init + 1
    //set play vector
    lda music_play
    sta m_addr_play
    lda music_play + 1
    sta m_addr_play + 1
    //init SID
    lda music_song
    jsr m_addr_init: $1000
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
    jsr m_addr_play: $1003
    /*
    todo:  read data from GoatTrack registers 
    and update the UI here! 
    */
!skip:
    rts

