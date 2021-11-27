# ons_paddo_music_disk

Music Disk by Patto/Onslaught released at Syntax 2021 in Melbourne, Australia. 

![Screenshot](https://csdb.dk/gfx/releases/211000/211449.gif)

CSDB Release Link:
https://csdb.dk/release/index.php?id=211449



## Credits
* 100 Glorious tunes by Patto/Onslaught
* Spectacular PETSCII graphics by Lobo/Onslaught
* Code by the newest member, Ziggy/Onslaught

## Developer Notes
IRQ Loader is from the game [Street Gang](https://csdb.dk/release/?id=16213), disassembled and reconstructed by Ziggy - code available [here](https://github.com/defame-demogroup/street_gang_loader)

Compression and runtime decompression is done with [Exomizer](https://bitbucket.org/magli143/exomizer/wiki/Home) which you need to compile for Linux and then set up on your path for the Makefile to work as expected.

Assembler used is [Kick Assembler v5](http://theweb.dk/KickAssembler/Main.html#frontpage) and I have created a small bash script to run Kick Assembler from the command `kick` (see below)

```
#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
java -jar "${DIR}/KickAss.jar" -afo $@
```

More complex code generation is done using hand written Python3 scripts. Note that Python 3.x needs to be installed as `python` on your environment.

Assumes you have installed VICE C64 emulator in your environment for the makefile to work as it uses `c1541` command to compile the disk image.

Code in this repo expects the following commands to be available on a Linux system:
* exomizer
* kick
* make
* c1541
* python

The Makefile is 'self documenting' - just type `make` to see the available build targets.
