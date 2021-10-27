.var xys_height = 10
.var xys_top = 0
.var xys_bot = xys_top + xys_height






.align $100
SPRITE_X_MSB:
.for(var i=0;i<256;i++)
{
    .var data = round(88 + 96*sin(toRadians(i*360/256)) * sin(toRadians(i*720/256))*cos(toRadians(i*1440/256)))
    .var msb = %00000000
    .if (data + x_min > 255){
        .eval msb = msb | %00000001
    }
    .if (data + x_min + (1 * 24) > 255){
        .eval msb = msb | %00000010
    }
    .if (data + x_min + (2 * 24) > 255){
        .eval msb = msb | %00000100
    }
    .if (data + x_min + (3 * 24) > 255){
        .eval msb = msb | %00001000
    }
    .if (data + x_min + (4 * 24) > 255){
        .eval msb = msb | %00010000
    }
    .if (data + x_min + (5 * 24) > 255){
        .eval msb = msb | %00100000
    }
    .if (data + x_min + (6 * 24) > 255){
        .eval msb = msb | %01000000
    }
    .if (data + x_min + (7 * 24) > 255){
        .eval msb = msb | %10000000
    }
    .byte msb
}
