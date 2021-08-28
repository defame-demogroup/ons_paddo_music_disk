/*
Memory Map
----------
These are the raw addresses of each of the 
animation frames based on the file groups
in petscii_include.asm 

Need to have this since we are dynamically
loading the groups of frames into the animation
buffer...

You need to load, de-exomize and then 
use these labels to actually address 
the animation frames for the rle-depacker!
*/
.var txt_drummer1 = $3000
.var col_drummer1 = $30c2
.var txt_drummer2 = $3161
.var col_drummer2 = $321a
.var txt_drummer3 = $32b8
.var col_drummer3 = $3361
.var txt_drummer4 = $33ed
.var col_drummer4 = $3494

.var  txt_final1 = $3000
.var  col_final1 = $3346
.var  txt_final2 = $35ab
.var  col_final2 = $38f1

.var  txt_irclefx1 = $3000
.var  col_irclefx1 = $3061
.var  txt_irclefx2 = $306a
.var  col_irclefx2 = $30d3
.var  txt_irclefx3 = $30dc
.var  col_irclefx3 = $3167
.var  txt_irclefx4 = $3170
.var  col_irclefx4 = $3201
.var  txt_irclefx5 = $320a
.var  col_irclefx5 = $32b3
.var  txt_irclefx6 = $32bc
.var  col_irclefx6 = $3375

.var  txt_lose1 = $3000
.var  col_lose1 = $338c
.var  txt_lose2 = $35e4
.var  col_lose2 = $394d
.var  txt_lose3 = $3c0b
.var  col_lose3 = $3f8c
.var  txt_lose4 = $4290
.var  col_lose4 = $4615

.var  txt_moreskulls1 = $3000
.var  col_moreskulls1 = $30e9
.var  txt_moreskulls2 = $31ba
.var  col_moreskulls2 = $32a4
.var  txt_moreskulls3 = $3377
.var  col_moreskulls3 = $3460
.var  txt_moreskulls4 = $3536
.var  col_moreskulls4 = $3620
.var  txt_moreskulls5 = $36f1
.var  col_moreskulls5 = $37da
.var  txt_moreskulls6 = $38af
.var  col_moreskulls6 = $3998
.var  txt_moreskulls7 = $3a6e
.var  col_moreskulls7 = $3b58

.var  txt_onslogo_only = $3000
.var  col_onslogo_only = $313d

.var  txt_open1 = $3000
.var  col_open1 = $3025
.var  txt_open2 = $3038
.var  col_open2 = $306a
.var  txt_open3 = $3088
.var  col_open3 = $30d8
.var  txt_open4 = $3103
.var  col_open4 = $3171
.var  txt_open5 = $31b4
.var  col_open5 = $3257
.var  txt_open6 = $32bf
.var  col_open6 = $33af
.var  txt_open7 = $345b
.var  col_open7 = $35ae
.var  txt_open8 = $369f
.var  col_open8 = $387b
.var  txt_open9 = $3a06
.var  col_open9 = $3bc3

.var  txt_openloop1 = $3000
.var  col_openloop1 = $333f
.var  txt_openloop2 = $34ca
.var  col_openloop2 = $37c2
.var  txt_openloop3 = $3932
.var  col_openloop3 = $3c5e
.var  txt_openloop4 = $3de9
.var  col_openloop4 = $40af

.var  txt_playe = $3000
.var  col_playe = $325d
.var  txt_player_doo = $3422
.var  col_player_doo = $3711

.var  txt_player_dooropen1 = $3000
.var  col_player_dooropen1 = $3301
.var  txt_player_dooropen2 = $3549
.var  col_player_dooropen2 = $381a
.var  txt_player_dooropen3 = $3a3f
.var  col_player_dooropen3 = $3ce0

.var  txt_redits = $3000
.var  col_redits = $3254

.var  txt_sk1 = $3000
.var  col_sk1 = $3296
.var  txt_sk2 = $32ab
.var  col_sk2 = $3357
.var  txt_sk3 = $3394
.var  col_sk3 = $3463
.var  txt_sk4 = $34ca
.var  col_sk4 = $35ad
.var  txt_sk5 = $3636
.var  col_sk5 = $3722
.var  txt_sk6 = $37bc
.var  col_sk6 = $38a7
.var  txt_sk7 = $393b
.var  col_sk7 = $3a1c
.var  txt_sk8 = $3aa3
.var  col_sk8 = $3b8a
.var  txt_sk9 = $3bf6
.var  col_sk9 = $3ce1
.var  txt_sk10 = $3d55
.var  col_sk10 = $3e3f
.var  txt_sk11 = $3e97
.var  col_sk11 = $3f6e
.var  txt_sk12 = $3fab
.var  col_sk12 = $406a

.var  txt_skullrotate1 = $3000
.var  col_skullrotate1 = $30ad
.var  txt_skullrotate2 = $3130
.var  col_skullrotate2 = $31bf
.var  txt_skullrotate3 = $3232
.var  col_skullrotate3 = $32c0
.var  txt_skullrotate4 = $3320
.var  col_skullrotate4 = $33bf
.var  txt_skullrotate5 = $3422
.var  col_skullrotate5 = $34b0
.var  txt_skullrotate6 = $3510
.var  col_skullrotate6 = $359f

