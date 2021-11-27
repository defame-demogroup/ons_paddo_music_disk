.var petscii_base=$a000

/*
Timeline 1 Assets (Note non-standard start addresses are super important!)
*/


.segment open [outPrg="../rsrc/gg.prg"]
.pc=$1800
//open1 : txt_open1 + col_open1
.pc=* "txt_open1"
.import c64 "rsrc/txt_open1.prg"
.pc=* "col_open1"
.import c64 "rsrc/col_open1.prg"
//open2 : txt_open2 + col_open2
.pc=* "txt_open2"
.import c64 "rsrc/txt_open2.prg"
.pc=* "col_open2"
.import c64 "rsrc/col_open2.prg"
//open3 : txt_open3 + col_open3
.pc=* "txt_open3"
.import c64 "rsrc/txt_open3.prg"
.pc=* "col_open3"
.import c64 "rsrc/col_open3.prg"
//open4 : txt_open4 + col_open4
.pc=* "txt_open4"
.import c64 "rsrc/txt_open4.prg"
.pc=* "col_open4"
.import c64 "rsrc/col_open4.prg"
//open5 : txt_open5 + col_open5
.pc=* "txt_open5"
.import c64 "rsrc/txt_open5.prg"
.pc=* "col_open5"
.import c64 "rsrc/col_open5.prg"
//open6 : txt_open6 + col_open6
.pc=* "txt_open6"
.import c64 "rsrc/txt_open6.prg"
.pc=* "col_open6"
.import c64 "rsrc/col_open6.prg"
//open7 : txt_open7 + col_open7
.pc=* "txt_open7"
.import c64 "rsrc/txt_open7.prg"
.pc=* "col_open7"
.import c64 "rsrc/col_open7.prg"
//open8 : txt_open8 + col_open8
.pc=* "txt_open8"
.import c64 "rsrc/txt_open8.prg"
.pc=* "col_open8"
.import c64 "rsrc/col_open8.prg"
//open9 : txt_open9 + col_open9
.pc=* "txt_open9"
.import c64 "rsrc/txt_open9.prg"
.pc=* "col_open9"
.import c64 "rsrc/col_open9.prg"

.segment open_loop [outPrg="../rsrc/hh.prg"]
.pc=$2600
//openloop1 : txt_openloop1 + col_openloop1
.pc=* "txt_openloop1"
.import c64 "rsrc/txt_openloop1.prg"
.pc=* "col_openloop1"
.import c64 "rsrc/col_openloop1.prg"
//openloop2 : txt_openloop2 + col_openloop2
.pc=* "txt_openloop2"
.import c64 "rsrc/txt_openloop2.prg"
.pc=* "col_openloop2"
.import c64 "rsrc/col_openloop2.prg"
//openloop3 : txt_openloop3 + col_openloop3
.pc=* "txt_openloop3"
.import c64 "rsrc/txt_openloop3.prg"
.pc=* "col_openloop3"
.import c64 "rsrc/col_openloop3.prg"
//openloop4 : txt_openloop4 + col_openloop4
.pc=* "txt_openloop4"
.import c64 "rsrc/txt_openloop4.prg"
.pc=* "col_openloop4"
.import c64 "rsrc/col_openloop4.prg"

.segment close [outPrg="../rsrc/jj.prg"]
.pc=$3900
//lose1 : txt_lose1 + col_lose1
.pc=* "txt_lose1"
.import c64 "rsrc/txt_lose1.prg"
.pc=* "col_lose1"
.import c64 "rsrc/col_lose1.prg"
//lose2 : txt_lose2 + col_lose2
.pc=* "txt_lose2"
.import c64 "rsrc/txt_lose2.prg"
.pc=* "col_lose2"
.import c64 "rsrc/col_lose2.prg"
//lose3 : txt_lose3 + col_lose3
.pc=* "txt_lose3"
.import c64 "rsrc/txt_lose3.prg"
.pc=* "col_lose3"
.import c64 "rsrc/col_lose3.prg"
//lose4 : txt_lose4 + col_lose4
.pc=* "txt_lose4"
.import c64 "rsrc/txt_lose4.prg"
.pc=* "col_lose4"
.import c64 "rsrc/col_lose4.prg"


.segment final [outPrg="../rsrc/bb.prg"]
.pc=petscii_base
//final1 : txt_final1 + col_final1
.pc=* "txt_final1"
.import c64 "rsrc/txt_final1.prg"
.pc=* "col_final1"
.import c64 "rsrc/col_final1.prg"
//final2 : txt_final2 + col_final2
.pc=* "txt_final2"
.import c64 "rsrc/txt_final2.prg"
.pc=* "col_final2"
.import c64 "rsrc/col_final2.prg"


/*
Timeline 2 Assets
*/

.segment drummer [outPrg="../rsrc/aa.prg"]
.pc=petscii_base
//player_dooropen1 : txt_player_dooropen1 + col_player_dooropen1
.pc=* "txt_player_doo"
.import c64 "rsrc/txt_player_door.prg"
.pc=* "col_player_doo"
.import c64 "rsrc/col_player_door.prg"
.pc=* "txt_player_dooropen1"
.import c64 "rsrc/txt_player_dooropen1.prg"
.pc=* "col_player_dooropen1"
.import c64 "rsrc/col_player_dooropen1.prg"
//player_dooropen2 : txt_player_dooropen2 + col_player_dooropen2
.pc=* "txt_player_dooropen2"
.import c64 "rsrc/txt_player_dooropen2.prg"
.pc=* "col_player_dooropen2"
.import c64 "rsrc/col_player_dooropen2.prg"
//player_dooropen3 : txt_player_dooropen3 + col_player_dooropen3
.pc=* "txt_player_dooropen3"
.import c64 "rsrc/txt_player_dooropen3.prg"
.pc=* "col_player_dooropen3"
.import c64 "rsrc/col_player_dooropen3.prg"
//drummer1 : txt_drummer1 + col_drummer1
.pc=* "txt_drummer1"
.import c64 "rsrc/txt_drummer1.prg"
.pc=* "col_drummer1"
.import c64 "rsrc/col_drummer1.prg"
//drummer2 : txt_drummer2 + col_drummer2
.pc=* "txt_drummer2"
.import c64 "rsrc/txt_drummer2.prg"
.pc=* "col_drummer2"
.import c64 "rsrc/col_drummer2.prg"
//drummer3 : txt_drummer3 + col_drummer3
.pc=* "txt_drummer3"
.import c64 "rsrc/txt_drummer3.prg"
.pc=* "col_drummer3"
.import c64 "rsrc/col_drummer3.prg"
//drummer4 : txt_drummer4 + col_drummer4
.pc=* "txt_drummer4"
.import c64 "rsrc/txt_drummer4.prg"
.pc=* "col_drummer4"
.import c64 "rsrc/col_drummer4.prg"


.segment moreskullz [outPrg="../rsrc/ee.prg"]
.pc=petscii_base
//player_dooropen1 : txt_player_dooropen1 + col_player_dooropen1
.pc=* "txt_player_doo"
.import c64 "rsrc/txt_player_door.prg"
.pc=* "col_player_doo"
.import c64 "rsrc/col_player_door.prg"
.pc=* "txt_player_dooropen1"
.import c64 "rsrc/txt_player_dooropen1.prg"
.pc=* "col_player_dooropen1"
.import c64 "rsrc/col_player_dooropen1.prg"
//player_dooropen2 : txt_player_dooropen2 + col_player_dooropen2
.pc=* "txt_player_dooropen2"
.import c64 "rsrc/txt_player_dooropen2.prg"
.pc=* "col_player_dooropen2"
.import c64 "rsrc/col_player_dooropen2.prg"
//player_dooropen3 : txt_player_dooropen3 + col_player_dooropen3
.pc=* "txt_player_dooropen3"
.import c64 "rsrc/txt_player_dooropen3.prg"
.pc=* "col_player_dooropen3"
.import c64 "rsrc/col_player_dooropen3.prg"
//moreskulls1 : txt_moreskulls1 + col_moreskulls1
.pc=* "txt_moreskulls1"
.import c64 "rsrc/txt_moreskulls1.prg"
.pc=* "col_moreskulls1"
.import c64 "rsrc/col_moreskulls1.prg"
//moreskulls2 : txt_moreskulls2 + col_moreskulls2
.pc=* "txt_moreskulls2"
.import c64 "rsrc/txt_moreskulls2.prg"
.pc=* "col_moreskulls2"
.import c64 "rsrc/col_moreskulls2.prg"
//moreskulls3 : txt_moreskulls3 + col_moreskulls3
.pc=* "txt_moreskulls3"
.import c64 "rsrc/txt_moreskulls3.prg"
.pc=* "col_moreskulls3"
.import c64 "rsrc/col_moreskulls3.prg"
//moreskulls4 : txt_moreskulls4 + col_moreskulls4
.pc=* "txt_moreskulls4"
.import c64 "rsrc/txt_moreskulls4.prg"
.pc=* "col_moreskulls4"
.import c64 "rsrc/col_moreskulls4.prg"
//moreskulls5 : txt_moreskulls5 + col_moreskulls5
.pc=* "txt_moreskulls5"
.import c64 "rsrc/txt_moreskulls5.prg"
.pc=* "col_moreskulls5"
.import c64 "rsrc/col_moreskulls5.prg"
//moreskulls6 : txt_moreskulls6 + col_moreskulls6
.pc=* "txt_moreskulls6"
.import c64 "rsrc/txt_moreskulls6.prg"
.pc=* "col_moreskulls6"
.import c64 "rsrc/col_moreskulls6.prg"
//moreskulls7 : txt_moreskulls7 + col_moreskulls7
.pc=* "txt_moreskulls7"
.import c64 "rsrc/txt_moreskulls7.prg"
.pc=* "col_moreskulls7"
.import c64 "rsrc/col_moreskulls7.prg"



.segment logo_ons [outPrg="../rsrc/ff.prg"]
.pc=petscii_base
//onslogo_only : txt_onslogo_only + col_onslogo_only
.pc=* "txt_onslogo_only"
.import c64 "rsrc/txt_onslogo_only.prg"
.pc=* "col_onslogo_only"
.import c64 "rsrc/col_onslogo_only.prg"

.segment playerbase [outPrg="../rsrc/ii.prg"]
.pc=petscii_base
//playe : txt_playe + col_playe
.pc=* "txt_playe"
.import c64 "rsrc/txt_player.prg"
.pc=* "col_playe"
.import c64 "rsrc/col_player.prg"
//player_doo : txt_player_doo + col_player_doo
.pc=* "txt_player_doo"
.import c64 "rsrc/txt_player_door.prg"
.pc=* "col_player_doo"
.import c64 "rsrc/col_player_door.prg"



// .segment door_open [outPrg="../rsrc/jj.prg"]
// .pc=petscii_base
// //player_dooropen1 : txt_player_dooropen1 + col_player_dooropen1
// .pc=* "txt_player_doo"
// .import c64 "rsrc/txt_player_door.prg"
// .pc=* "col_player_doo"
// .import c64 "rsrc/col_player_door.prg"
// .pc=* "txt_player_dooropen1"
// .import c64 "rsrc/txt_player_dooropen1.prg"
// .pc=* "col_player_dooropen1"
// .import c64 "rsrc/col_player_dooropen1.prg"
// //player_dooropen2 : txt_player_dooropen2 + col_player_dooropen2
// .pc=* "txt_player_dooropen2"
// .import c64 "rsrc/txt_player_dooropen2.prg"
// .pc=* "col_player_dooropen2"
// .import c64 "rsrc/col_player_dooropen2.prg"
// //player_dooropen3 : txt_player_dooropen3 + col_player_dooropen3
// .pc=* "txt_player_dooropen3"
// .import c64 "rsrc/txt_player_dooropen3.prg"
// .pc=* "col_player_dooropen3"
// .import c64 "rsrc/col_player_dooropen3.prg"



.segment credits [outPrg="../rsrc/kk.prg"]
.pc=petscii_base
//redits : txt_redits + col_redits
.pc=* "txt_redits"
.import c64 "rsrc/txt_redits.prg"
.pc=* "col_redits"
.import c64 "rsrc/col_redits.prg"



.segment sk [outPrg="../rsrc/ll.prg"]
.pc=petscii_base
//player_dooropen1 : txt_player_dooropen1 + col_player_dooropen1
.pc=* "txt_player_doo"
.import c64 "rsrc/txt_player_door.prg"
.pc=* "col_player_doo"
.import c64 "rsrc/col_player_door.prg"
.pc=* "txt_player_dooropen1"
.import c64 "rsrc/txt_player_dooropen1.prg"
.pc=* "col_player_dooropen1"
.import c64 "rsrc/col_player_dooropen1.prg"
//player_dooropen2 : txt_player_dooropen2 + col_player_dooropen2
.pc=* "txt_player_dooropen2"
.import c64 "rsrc/txt_player_dooropen2.prg"
.pc=* "col_player_dooropen2"
.import c64 "rsrc/col_player_dooropen2.prg"
//player_dooropen3 : txt_player_dooropen3 + col_player_dooropen3
.pc=* "txt_player_dooropen3"
.import c64 "rsrc/txt_player_dooropen3.prg"
.pc=* "col_player_dooropen3"
.import c64 "rsrc/col_player_dooropen3.prg"
//sk1 : txt_sk1 + col_sk1
.pc=* "txt_sk1"
.import c64 "rsrc/txt_sk1.prg"
.pc=* "col_sk1"
.import c64 "rsrc/col_sk1.prg"
//sk2 : txt_sk2 + col_sk2
.pc=* "txt_sk2"
.import c64 "rsrc/txt_sk2.prg"
.pc=* "col_sk2"
.import c64 "rsrc/col_sk2.prg"
//sk3 : txt_sk3 + col_sk3
.pc=* "txt_sk3"
.import c64 "rsrc/txt_sk3.prg"
.pc=* "col_sk3"
.import c64 "rsrc/col_sk3.prg"
//sk4 : txt_sk4 + col_sk4
.pc=* "txt_sk4"
.import c64 "rsrc/txt_sk4.prg"
.pc=* "col_sk4"
.import c64 "rsrc/col_sk4.prg"
//sk5 : txt_sk5 + col_sk5
.pc=* "txt_sk5"
.import c64 "rsrc/txt_sk5.prg"
.pc=* "col_sk5"
.import c64 "rsrc/col_sk5.prg"
//sk6 : txt_sk6 + col_sk6
.pc=* "txt_sk6"
.import c64 "rsrc/txt_sk6.prg"
.pc=* "col_sk6"
.import c64 "rsrc/col_sk6.prg"
//sk7 : txt_sk7 + col_sk7
.pc=* "txt_sk7"
.import c64 "rsrc/txt_sk7.prg"
.pc=* "col_sk7"
.import c64 "rsrc/col_sk7.prg"
//sk8 : txt_sk8 + col_sk8
.pc=* "txt_sk8"
.import c64 "rsrc/txt_sk8.prg"
.pc=* "col_sk8"
.import c64 "rsrc/col_sk8.prg"
//sk9 : txt_sk9 + col_sk9
.pc=* "txt_sk9"
.import c64 "rsrc/txt_sk9.prg"
.pc=* "col_sk9"
.import c64 "rsrc/col_sk9.prg"
//sk10 : txt_sk10 + col_sk10
.pc=* "txt_sk10"
.import c64 "rsrc/txt_sk10.prg"
.pc=* "col_sk10"
.import c64 "rsrc/col_sk10.prg"
//sk11 : txt_sk11 + col_sk11
.pc=* "txt_sk11"
.import c64 "rsrc/txt_sk11.prg"
.pc=* "col_sk11"
.import c64 "rsrc/col_sk11.prg"
//sk12 : txt_sk12 + col_sk12
.pc=* "txt_sk12"
.import c64 "rsrc/txt_sk12.prg"
.pc=* "col_sk12"
.import c64 "rsrc/col_sk12.prg"





.segment skull_rotate [outPrg="../rsrc/mm.prg"]
.pc=petscii_base
//player_dooropen1 : txt_player_dooropen1 + col_player_dooropen1
.pc=* "txt_player_doo"
.import c64 "rsrc/txt_player_door.prg"
.pc=* "col_player_doo"
.import c64 "rsrc/col_player_door.prg"
.pc=* "txt_player_dooropen1"
.import c64 "rsrc/txt_player_dooropen1.prg"
.pc=* "col_player_dooropen1"
.import c64 "rsrc/col_player_dooropen1.prg"
//player_dooropen2 : txt_player_dooropen2 + col_player_dooropen2
.pc=* "txt_player_dooropen2"
.import c64 "rsrc/txt_player_dooropen2.prg"
.pc=* "col_player_dooropen2"
.import c64 "rsrc/col_player_dooropen2.prg"
//player_dooropen3 : txt_player_dooropen3 + col_player_dooropen3
.pc=* "txt_player_dooropen3"
.import c64 "rsrc/txt_player_dooropen3.prg"
.pc=* "col_player_dooropen3"
.import c64 "rsrc/col_player_dooropen3.prg"
//skullrotate1 : txt_skullrotate1 + col_skullrotate1
.pc=* "txt_skullrotate1"
.import c64 "rsrc/txt_skullrotate1.prg"
.pc=* "col_skullrotate1"
.import c64 "rsrc/col_skullrotate1.prg"
//skullrotate2 : txt_skullrotate2 + col_skullrotate2
.pc=* "txt_skullrotate2"
.import c64 "rsrc/txt_skullrotate2.prg"
.pc=* "col_skullrotate2"
.import c64 "rsrc/col_skullrotate2.prg"
//skullrotate3 : txt_skullrotate3 + col_skullrotate3
.pc=* "txt_skullrotate3"
.import c64 "rsrc/txt_skullrotate3.prg"
.pc=* "col_skullrotate3"
.import c64 "rsrc/col_skullrotate3.prg"
//skullrotate4 : txt_skullrotate4 + col_skullrotate4
.pc=* "txt_skullrotate4"
.import c64 "rsrc/txt_skullrotate4.prg"
.pc=* "col_skullrotate4"
.import c64 "rsrc/col_skullrotate4.prg"
//skullrotate5 : txt_skullrotate5 + col_skullrotate5
.pc=* "txt_skullrotate5"
.import c64 "rsrc/txt_skullrotate5.prg"
.pc=* "col_skullrotate5"
.import c64 "rsrc/col_skullrotate5.prg"
//skullrotate6 : txt_skullrotate6 + col_skullrotate6
.pc=* "txt_skullrotate6"
.import c64 "rsrc/txt_skullrotate6.prg"
.pc=* "col_skullrotate6"
.import c64 "rsrc/col_skullrotate6.prg"



.segment turn_disk [outPrg="../rsrc/nn.prg"]
.pc=petscii_base
.pc=* "txt_player_doo"
.import c64 "rsrc/txt_player_door.prg"
.pc=* "col_player_doo"
.import c64 "rsrc/col_player_door.prg"
.pc=* "txt_player_dooropen1"
.import c64 "rsrc/txt_player_dooropen1.prg"
.pc=* "col_player_dooropen1"
.import c64 "rsrc/col_player_dooropen1.prg"
//player_dooropen2 : txt_player_dooropen2 + col_player_dooropen2
.pc=* "txt_player_dooropen2"
.import c64 "rsrc/txt_player_dooropen2.prg"
.pc=* "col_player_dooropen2"
.import c64 "rsrc/col_player_dooropen2.prg"
//player_dooropen3 : txt_player_dooropen3 + col_player_dooropen3
.pc=* "txt_player_dooropen3"
.import c64 "rsrc/txt_player_dooropen3.prg"
.pc=* "col_player_dooropen3"
.import c64 "rsrc/col_player_dooropen3.prg"
// //z_turndisk bottom: txt_z_turndisk + col_z_turndisk
// .pc=* "txt_z_turndisk_bottom"
// .import c64 "rsrc/txt_z_turndisk_bottom.prg"
// .pc=* "col_z_turndisk_bottom"
// .import c64 "rsrc/col_z_turndisk_bottom.prg"
//z_turndisk top : txt_z_turndisk + col_z_turndisk
.pc=* "txt_z_turndisk_top"
.import c64 "rsrc/txt_z_turndisk_top.prg"
.pc=* "col_z_turndisk_top"
.import c64 "rsrc/col_z_turndisk_top.prg"


.segment circle [outPrg="../rsrc/cc.prg"]
.pc=petscii_base
//player_dooropen1 : txt_player_dooropen1 + col_player_dooropen1
.pc=* "txt_player_doo"
.import c64 "rsrc/txt_player_door.prg"
.pc=* "col_player_doo"
.import c64 "rsrc/col_player_door.prg"
.pc=* "txt_player_dooropen1"
.import c64 "rsrc/txt_player_dooropen1.prg"
.pc=* "col_player_dooropen1"
.import c64 "rsrc/col_player_dooropen1.prg"
//player_dooropen2 : txt_player_dooropen2 + col_player_dooropen2
.pc=* "txt_player_dooropen2"
.import c64 "rsrc/txt_player_dooropen2.prg"
.pc=* "col_player_dooropen2"
.import c64 "rsrc/col_player_dooropen2.prg"
//player_dooropen3 : txt_player_dooropen3 + col_player_dooropen3
.pc=* "txt_player_dooropen3"
.import c64 "rsrc/txt_player_dooropen3.prg"
.pc=* "col_player_dooropen3"
.import c64 "rsrc/col_player_dooropen3.prg"
//zz_ls7 : txt_zz_ls7 + col_zz_ls7
.pc=* "txt_zz_ls7"
.import c64 "rsrc/txt_zz_ls7.prg"
.pc=* "col_zz_ls7"
.import c64 "rsrc/col_zz_ls7.prg"
//zz_ls9 : txt_zz_ls9 + col_zz_ls9
.pc=* "txt_zz_ls9"
.import c64 "rsrc/txt_zz_ls9.prg"
.pc=* "col_zz_ls9"
.import c64 "rsrc/col_zz_ls9.prg"
//zz_ls11 : txt_zz_ls11 + col_zz_ls11
.pc=* "txt_zz_ls11"
.import c64 "rsrc/txt_zz_ls11.prg"
.pc=* "col_zz_ls11"
.import c64 "rsrc/col_zz_ls11.prg"
//zz_ls13 : txt_zz_ls13 + col_zz_ls13
.pc=* "txt_zz_ls13"
.import c64 "rsrc/txt_zz_ls13.prg"
.pc=* "col_zz_ls13"
.import c64 "rsrc/col_zz_ls13.prg"
//zz_ls15 : txt_zz_ls15 + col_zz_ls15
.pc=* "txt_zz_ls15"
.import c64 "rsrc/txt_zz_ls15.prg"
.pc=* "col_zz_ls15"
.import c64 "rsrc/col_zz_ls15.prg"
//zz_ls17 : txt_zz_ls17 + col_zz_ls17
.pc=* "txt_zz_ls17"
.import c64 "rsrc/txt_zz_ls17.prg"
.pc=* "col_zz_ls17"
.import c64 "rsrc/col_zz_ls17.prg"
//zz_ls19 : txt_zz_ls19 + col_zz_ls19
.pc=* "txt_zz_ls19"
.import c64 "rsrc/txt_zz_ls19.prg"
.pc=* "col_zz_ls19"
.import c64 "rsrc/col_zz_ls19.prg"
//zz_ls21 : txt_zz_ls21 + col_zz_ls21
.pc=* "txt_zz_ls21"
.import c64 "rsrc/txt_zz_ls21.prg"
.pc=* "col_zz_ls21"
.import c64 "rsrc/col_zz_ls21.prg"
//zz_ls23 : txt_zz_ls23 + col_zz_ls23
.pc=* "txt_zz_ls23"
.import c64 "rsrc/txt_zz_ls23.prg"
.pc=* "col_zz_ls23"
.import c64 "rsrc/col_zz_ls23.prg"
//zz_ls25 : txt_zz_ls25 + col_zz_ls25
.pc=* "txt_zz_ls25"
.import c64 "rsrc/txt_zz_ls25.prg"
.pc=* "col_zz_ls25"
.import c64 "rsrc/col_zz_ls25.prg"
//zz_ls27 : txt_zz_ls27 + col_zz_ls27
.pc=* "txt_zz_ls27"
.import c64 "rsrc/txt_zz_ls27.prg"
.pc=* "col_zz_ls27"
.import c64 "rsrc/col_zz_ls27.prg"
//zz_ls29 : txt_zz_ls29 + col_zz_ls29
.pc=* "txt_zz_ls29"
.import c64 "rsrc/txt_zz_ls29.prg"
.pc=* "col_zz_ls29"
.import c64 "rsrc/col_zz_ls29.prg"
//zz_ls31 : txt_zz_ls31 + col_zz_ls31
.pc=* "txt_zz_ls31"
.import c64 "rsrc/txt_zz_ls31.prg"
.pc=* "col_zz_ls31"
.import c64 "rsrc/col_zz_ls31.prg"
//zz_ls33 : txt_zz_ls33 + col_zz_ls33
.pc=* "txt_zz_ls33"
.import c64 "rsrc/txt_zz_ls33.prg"
.pc=* "col_zz_ls33"
.import c64 "rsrc/col_zz_ls33.prg"
//zz_ls35 : txt_zz_ls35 + col_zz_ls35
.pc=* "txt_zz_ls35"
.import c64 "rsrc/txt_zz_ls35.prg"
.pc=* "col_zz_ls35"
.import c64 "rsrc/col_zz_ls35.prg"
//zz_ls37 : txt_zz_ls37 + col_zz_ls37
.pc=* "txt_zz_ls37"
.import c64 "rsrc/txt_zz_ls37.prg"
.pc=* "col_zz_ls37"
.import c64 "rsrc/col_zz_ls37.prg"
//zz_ls39 : txt_zz_ls39 + col_zz_ls39
.pc=* "txt_zz_ls39"
.import c64 "rsrc/txt_zz_ls39.prg"
.pc=* "col_zz_ls39"
.import c64 "rsrc/col_zz_ls39.prg"

