.var petscii_base=$3000

.segment drummer [outPrg="../rsrc/aa.prg"]
.pc=petscii_base
//drummer1 : txt_drummer1 + col_drummer1
.pc=* "txt_drummer1"
txt_00:
.import c64 "rsrc/txt_drummer1.prg"
.pc=* "col_drummer1"
col_00: 
.import c64 "rsrc/col_drummer1.prg"

//drummer2 : txt_drummer2 + col_drummer2
.pc=* "txt_drummer2"
txt_01:
.import c64 "rsrc/txt_drummer2.prg"
.pc=* "col_drummer2"
col_01: 
.import c64 "rsrc/col_drummer2.prg"

//drummer3 : txt_drummer3 + col_drummer3
.pc=* "txt_drummer3"
txt_02:
.import c64 "rsrc/txt_drummer3.prg"
.pc=* "col_drummer3"
col_02: 
.import c64 "rsrc/col_drummer3.prg"

//drummer4 : txt_drummer4 + col_drummer4
.pc=* "txt_drummer4"
txt_03:
.import c64 "rsrc/txt_drummer4.prg"
.pc=* "col_drummer4"
col_03: 
.import c64 "rsrc/col_drummer4.prg"




.segment final [outPrg="../rsrc/bb.prg"]
.pc=petscii_base
//final1 : txt_final1 + col_final1
.pc=* "txt_final1"
txt_04:
.import c64 "rsrc/txt_final1.prg"
.pc=* "col_final1"
col_04: 
.import c64 "rsrc/col_final1.prg"

//final2 : txt_final2 + col_final2
.pc=* "txt_final2"
txt_05:
.import c64 "rsrc/txt_final2.prg"
.pc=* "col_final2"
col_05: 
.import c64 "rsrc/col_final2.prg"




.segment circle [outPrg="../rsrc/cc.prg"]
.pc=petscii_base
//irclefx1 : txt_irclefx1 + col_irclefx1
.pc=* "txt_irclefx1"
txt_06:
.import c64 "rsrc/txt_irclefx1.prg"
.pc=* "col_irclefx1"
col_06: 
.import c64 "rsrc/col_irclefx1.prg"

//irclefx2 : txt_irclefx2 + col_irclefx2
.pc=* "txt_irclefx2"
txt_07:
.import c64 "rsrc/txt_irclefx2.prg"
.pc=* "col_irclefx2"
col_07: 
.import c64 "rsrc/col_irclefx2.prg"

//irclefx3 : txt_irclefx3 + col_irclefx3
.pc=* "txt_irclefx3"
txt_08:
.import c64 "rsrc/txt_irclefx3.prg"
.pc=* "col_irclefx3"
col_08: 
.import c64 "rsrc/col_irclefx3.prg"

//irclefx4 : txt_irclefx4 + col_irclefx4
.pc=* "txt_irclefx4"
txt_09:
.import c64 "rsrc/txt_irclefx4.prg"
.pc=* "col_irclefx4"
col_09: 
.import c64 "rsrc/col_irclefx4.prg"

//irclefx5 : txt_irclefx5 + col_irclefx5
.pc=* "txt_irclefx5"
txt_10:
.import c64 "rsrc/txt_irclefx5.prg"
.pc=* "col_irclefx5"
col_10: 
.import c64 "rsrc/col_irclefx5.prg"

//irclefx6 : txt_irclefx6 + col_irclefx6
.pc=* "txt_irclefx6"
txt_11:
.import c64 "rsrc/txt_irclefx6.prg"
.pc=* "col_irclefx6"
col_11: 
.import c64 "rsrc/col_irclefx6.prg"




.segment close [outPrg="../rsrc/dd.prg"]
.pc=petscii_base
//lose1 : txt_lose1 + col_lose1
.pc=* "txt_lose1"
txt_12:
.import c64 "rsrc/txt_lose1.prg"
.pc=* "col_lose1"
col_12: 
.import c64 "rsrc/col_lose1.prg"

//lose2 : txt_lose2 + col_lose2
.pc=* "txt_lose2"
txt_13:
.import c64 "rsrc/txt_lose2.prg"
.pc=* "col_lose2"
col_13: 
.import c64 "rsrc/col_lose2.prg"

//lose3 : txt_lose3 + col_lose3
.pc=* "txt_lose3"
txt_14:
.import c64 "rsrc/txt_lose3.prg"
.pc=* "col_lose3"
col_14: 
.import c64 "rsrc/col_lose3.prg"

//lose4 : txt_lose4 + col_lose4
.pc=* "txt_lose4"
txt_15:
.import c64 "rsrc/txt_lose4.prg"
.pc=* "col_lose4"
col_15: 
.import c64 "rsrc/col_lose4.prg"




.segment moreskullz [outPrg="../rsrc/ee.prg"]
.pc=petscii_base
//moreskulls1 : txt_moreskulls1 + col_moreskulls1
.pc=* "txt_moreskulls1"
txt_16:
.import c64 "rsrc/txt_moreskulls1.prg"
.pc=* "col_moreskulls1"
col_16: 
.import c64 "rsrc/col_moreskulls1.prg"

//moreskulls2 : txt_moreskulls2 + col_moreskulls2
.pc=* "txt_moreskulls2"
txt_17:
.import c64 "rsrc/txt_moreskulls2.prg"
.pc=* "col_moreskulls2"
col_17: 
.import c64 "rsrc/col_moreskulls2.prg"

//moreskulls3 : txt_moreskulls3 + col_moreskulls3
.pc=* "txt_moreskulls3"
txt_18:
.import c64 "rsrc/txt_moreskulls3.prg"
.pc=* "col_moreskulls3"
col_18: 
.import c64 "rsrc/col_moreskulls3.prg"

//moreskulls4 : txt_moreskulls4 + col_moreskulls4
.pc=* "txt_moreskulls4"
txt_19:
.import c64 "rsrc/txt_moreskulls4.prg"
.pc=* "col_moreskulls4"
col_19: 
.import c64 "rsrc/col_moreskulls4.prg"

//moreskulls5 : txt_moreskulls5 + col_moreskulls5
.pc=* "txt_moreskulls5"
txt_20:
.import c64 "rsrc/txt_moreskulls5.prg"
.pc=* "col_moreskulls5"
col_20: 
.import c64 "rsrc/col_moreskulls5.prg"

//moreskulls6 : txt_moreskulls6 + col_moreskulls6
.pc=* "txt_moreskulls6"
txt_21:
.import c64 "rsrc/txt_moreskulls6.prg"
.pc=* "col_moreskulls6"
col_21: 
.import c64 "rsrc/col_moreskulls6.prg"

//moreskulls7 : txt_moreskulls7 + col_moreskulls7
.pc=* "txt_moreskulls7"
txt_22:
.import c64 "rsrc/txt_moreskulls7.prg"
.pc=* "col_moreskulls7"
col_22: 
.import c64 "rsrc/col_moreskulls7.prg"



.segment logo_ons [outPrg="../rsrc/ff.prg"]
.pc=petscii_base
//onslogo_only : txt_onslogo_only + col_onslogo_only
.pc=* "txt_onslogo_only"
txt_23:
.import c64 "rsrc/txt_onslogo_only.prg"
.pc=* "col_onslogo_only"
col_23: 
.import c64 "rsrc/col_onslogo_only.prg"



.segment open [outPrg="../rsrc/gg.prg"]
.pc=petscii_base
//open1 : txt_open1 + col_open1
.pc=* "txt_open1"
txt_24:
.import c64 "rsrc/txt_open1.prg"
.pc=* "col_open1"
col_24: 
.import c64 "rsrc/col_open1.prg"

//open2 : txt_open2 + col_open2
.pc=* "txt_open2"
txt_25:
.import c64 "rsrc/txt_open2.prg"
.pc=* "col_open2"
col_25: 
.import c64 "rsrc/col_open2.prg"

//open3 : txt_open3 + col_open3
.pc=* "txt_open3"
txt_26:
.import c64 "rsrc/txt_open3.prg"
.pc=* "col_open3"
col_26: 
.import c64 "rsrc/col_open3.prg"

//open4 : txt_open4 + col_open4
.pc=* "txt_open4"
txt_27:
.import c64 "rsrc/txt_open4.prg"
.pc=* "col_open4"
col_27: 
.import c64 "rsrc/col_open4.prg"

//open5 : txt_open5 + col_open5
.pc=* "txt_open5"
txt_28:
.import c64 "rsrc/txt_open5.prg"
.pc=* "col_open5"
col_28: 
.import c64 "rsrc/col_open5.prg"

//open6 : txt_open6 + col_open6
.pc=* "txt_open6"
txt_29:
.import c64 "rsrc/txt_open6.prg"
.pc=* "col_open6"
col_29: 
.import c64 "rsrc/col_open6.prg"

//open7 : txt_open7 + col_open7
.pc=* "txt_open7"
txt_30:
.import c64 "rsrc/txt_open7.prg"
.pc=* "col_open7"
col_30: 
.import c64 "rsrc/col_open7.prg"

//open8 : txt_open8 + col_open8
.pc=* "txt_open8"
txt_31:
.import c64 "rsrc/txt_open8.prg"
.pc=* "col_open8"
col_31: 
.import c64 "rsrc/col_open8.prg"

//open9 : txt_open9 + col_open9
.pc=* "txt_open9"
txt_32:
.import c64 "rsrc/txt_open9.prg"
.pc=* "col_open9"
col_32: 
.import c64 "rsrc/col_open9.prg"




.segment open_loop [outPrg="../rsrc/hh.prg"]
.pc=petscii_base
//openloop1 : txt_openloop1 + col_openloop1
.pc=* "txt_openloop1"
txt_33:
.import c64 "rsrc/txt_openloop1.prg"
.pc=* "col_openloop1"
col_33: 
.import c64 "rsrc/col_openloop1.prg"

//openloop2 : txt_openloop2 + col_openloop2
.pc=* "txt_openloop2"
txt_34:
.import c64 "rsrc/txt_openloop2.prg"
.pc=* "col_openloop2"
col_34: 
.import c64 "rsrc/col_openloop2.prg"

//openloop3 : txt_openloop3 + col_openloop3
.pc=* "txt_openloop3"
txt_35:
.import c64 "rsrc/txt_openloop3.prg"
.pc=* "col_openloop3"
col_35: 
.import c64 "rsrc/col_openloop3.prg"

//openloop4 : txt_openloop4 + col_openloop4
.pc=* "txt_openloop4"
txt_36:
.import c64 "rsrc/txt_openloop4.prg"
.pc=* "col_openloop4"
col_36: 
.import c64 "rsrc/col_openloop4.prg"



.segment playerbase [outPrg="../rsrc/ii.prg"]
.pc=petscii_base
//playe : txt_playe + col_playe
.pc=* "txt_playe"
txt_37:
.import c64 "rsrc/txt_player.prg"
.pc=* "col_playe"
col_37: 
.import c64 "rsrc/col_player.prg"

//player_doo : txt_player_doo + col_player_doo
.pc=* "txt_player_doo"
txt_38:
.import c64 "rsrc/txt_player_door.prg"
.pc=* "col_player_doo"
col_38: 
.import c64 "rsrc/col_player_door.prg"



.segment door_open [outPrg="../rsrc/jj.prg"]
.pc=petscii_base
//player_dooropen1 : txt_player_dooropen1 + col_player_dooropen1
.pc=* "txt_player_dooropen1"
txt_39:
.import c64 "rsrc/txt_player_dooropen1.prg"
.pc=* "col_player_dooropen1"
col_39: 
.import c64 "rsrc/col_player_dooropen1.prg"

//player_dooropen2 : txt_player_dooropen2 + col_player_dooropen2
.pc=* "txt_player_dooropen2"
txt_40:
.import c64 "rsrc/txt_player_dooropen2.prg"
.pc=* "col_player_dooropen2"
col_40: 
.import c64 "rsrc/col_player_dooropen2.prg"

//player_dooropen3 : txt_player_dooropen3 + col_player_dooropen3
.pc=* "txt_player_dooropen3"
txt_41:
.import c64 "rsrc/txt_player_dooropen3.prg"
.pc=* "col_player_dooropen3"
col_41: 
.import c64 "rsrc/col_player_dooropen3.prg"



.segment credits [outPrg="../rsrc/kk.prg"]
.pc=petscii_base
//redits : txt_redits + col_redits
.pc=* "txt_redits"
txt_42:
.import c64 "rsrc/txt_redits.prg"
.pc=* "col_redits"
col_42: 
.import c64 "rsrc/col_redits.prg"



.segment sk [outPrg="../rsrc/ll.prg"]
.pc=petscii_base
//sk1 : txt_sk1 + col_sk1
.pc=* "txt_sk1"
txt_43:
.import c64 "rsrc/txt_sk1.prg"
.pc=* "col_sk1"
col_43: 
.import c64 "rsrc/col_sk1.prg"

//sk2 : txt_sk2 + col_sk2
.pc=* "txt_sk2"
txt_47:
.import c64 "rsrc/txt_sk2.prg"
.pc=* "col_sk2"
col_47: 
.import c64 "rsrc/col_sk2.prg"

//sk3 : txt_sk3 + col_sk3
.pc=* "txt_sk3"
txt_48:
.import c64 "rsrc/txt_sk3.prg"
.pc=* "col_sk3"
col_48: 
.import c64 "rsrc/col_sk3.prg"

//sk4 : txt_sk4 + col_sk4
.pc=* "txt_sk4"
txt_49:
.import c64 "rsrc/txt_sk4.prg"
.pc=* "col_sk4"
col_49: 
.import c64 "rsrc/col_sk4.prg"

//sk5 : txt_sk5 + col_sk5
.pc=* "txt_sk5"
txt_50:
.import c64 "rsrc/txt_sk5.prg"
.pc=* "col_sk5"
col_50: 
.import c64 "rsrc/col_sk5.prg"

//sk6 : txt_sk6 + col_sk6
.pc=* "txt_sk6"
txt_51:
.import c64 "rsrc/txt_sk6.prg"
.pc=* "col_sk6"
col_51: 
.import c64 "rsrc/col_sk6.prg"

//sk7 : txt_sk7 + col_sk7
.pc=* "txt_sk7"
txt_52:
.import c64 "rsrc/txt_sk7.prg"
.pc=* "col_sk7"
col_52: 
.import c64 "rsrc/col_sk7.prg"

//sk8 : txt_sk8 + col_sk8
.pc=* "txt_sk8"
txt_53:
.import c64 "rsrc/txt_sk8.prg"
.pc=* "col_sk8"
col_53: 
.import c64 "rsrc/col_sk8.prg"

//sk9 : txt_sk9 + col_sk9
.pc=* "txt_sk9"
txt_54:
.import c64 "rsrc/txt_sk9.prg"
.pc=* "col_sk9"
col_54: 
.import c64 "rsrc/col_sk9.prg"

//sk10 : txt_sk10 + col_sk10
.pc=* "txt_sk10"
txt_44:
.import c64 "rsrc/txt_sk10.prg"
.pc=* "col_sk10"
col_44: 
.import c64 "rsrc/col_sk10.prg"

//sk11 : txt_sk11 + col_sk11
.pc=* "txt_sk11"
txt_45:
.import c64 "rsrc/txt_sk11.prg"
.pc=* "col_sk11"
col_45: 
.import c64 "rsrc/col_sk11.prg"

//sk12 : txt_sk12 + col_sk12
.pc=* "txt_sk12"
txt_46:
.import c64 "rsrc/txt_sk12.prg"
.pc=* "col_sk12"
col_46: 
.import c64 "rsrc/col_sk12.prg"





.segment skull_rotate [outPrg="../rsrc/mm.prg"]
.pc=petscii_base
//skullrotate1 : txt_skullrotate1 + col_skullrotate1
.pc=* "txt_skullrotate1"
txt_55:
.import c64 "rsrc/txt_skullrotate1.prg"
.pc=* "col_skullrotate1"
col_55: 
.import c64 "rsrc/col_skullrotate1.prg"

//skullrotate2 : txt_skullrotate2 + col_skullrotate2
.pc=* "txt_skullrotate2"
txt_56:
.import c64 "rsrc/txt_skullrotate2.prg"
.pc=* "col_skullrotate2"
col_56: 
.import c64 "rsrc/col_skullrotate2.prg"

//skullrotate3 : txt_skullrotate3 + col_skullrotate3
.pc=* "txt_skullrotate3"
txt_57:
.import c64 "rsrc/txt_skullrotate3.prg"
.pc=* "col_skullrotate3"
col_57: 
.import c64 "rsrc/col_skullrotate3.prg"

//skullrotate4 : txt_skullrotate4 + col_skullrotate4
.pc=* "txt_skullrotate4"
txt_58:
.import c64 "rsrc/txt_skullrotate4.prg"
.pc=* "col_skullrotate4"
col_58: 
.import c64 "rsrc/col_skullrotate4.prg"

//skullrotate5 : txt_skullrotate5 + col_skullrotate5
.pc=* "txt_skullrotate5"
txt_59:
.import c64 "rsrc/txt_skullrotate5.prg"
.pc=* "col_skullrotate5"
col_59: 
.import c64 "rsrc/col_skullrotate5.prg"

//skullrotate6 : txt_skullrotate6 + col_skullrotate6
.pc=* "txt_skullrotate6"
txt_60:
.import c64 "rsrc/txt_skullrotate6.prg"
.pc=* "col_skullrotate6"
col_60: 
.import c64 "rsrc/col_skullrotate6.prg"
