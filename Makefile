#
#MAKEFILE FOR C64 Demos
#Copyright 2019-2021 Zig/Defame
#
SHELL := /bin/bash

help: ## This help
	@echo -e "----------------------------------------------\nPaddo's Music Disk: An Onslaught Production...\n----------------------------------------------\n"
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"
	@echo -e "\n\nCheck the 'all' target to see the order of build required."

all: build disk1.d64 disk2.d64  ## clean up and make the disk images

autogenerate: ## autogenerate conversion templates
	bin/convert_c.py
	bin/convert_sid.py
	bin/disk_image.py

rsrc: autogenerate ## populate the rsrc directory from autogenerated templates
	cd src;kick convert_animations.asm
	cd src;kick convert_music.asm

src/demo.prg: src/demo.asm ## compile c64 demo
	bin/petscii_include.py
	bin/sid_include.py
	kick $<
	mkdir -p build
	cd src;exomizer sfx basic -n -B -o ../build/demo.prg demo.prg

build: clean autogenerate rsrc src/demo.prg ## Exomize all resources into build dir
	mkdir -p build
	cd rsrc;exomizer mem -l auto aa.prg -o ../build/aa.prg
	cd rsrc;exomizer mem -l auto bb.prg -o ../build/bb.prg
	cd rsrc;exomizer mem -l auto cc.prg -o ../build/cc.prg
	cd rsrc;exomizer mem -l auto dd.prg -o ../build/dd.prg
	cd rsrc;exomizer mem -l auto ee.prg -o ../build/ee.prg
	cd rsrc;exomizer mem -l auto ff.prg -o ../build/ff.prg
	cd rsrc;exomizer mem -l auto gg.prg -o ../build/gg.prg
	cd rsrc;exomizer mem -l auto hh.prg -o ../build/hh.prg
	cd rsrc;exomizer mem -l auto ii.prg -o ../build/ii.prg
	cd rsrc;exomizer mem -l auto jj.prg -o ../build/jj.prg
	cd rsrc;exomizer mem -l auto kk.prg -o ../build/kk.prg
	cd rsrc;exomizer mem -l auto ll.prg -o ../build/ll.prg
	cd rsrc;exomizer mem -l auto mm.prg -o ../build/mm.prg
	cd rsrc;exomizer mem -l auto 00.prg -o ../build/00.prg
	cd rsrc;exomizer mem -l auto 01.prg -o ../build/01.prg
	cd rsrc;exomizer mem -l auto 02.prg -o ../build/02.prg
	cd rsrc;exomizer mem -l auto 03.prg -o ../build/03.prg
	cd rsrc;exomizer mem -l auto 04.prg -o ../build/04.prg
	cd rsrc;exomizer mem -l auto 05.prg -o ../build/05.prg
	cd rsrc;exomizer mem -l auto 06.prg -o ../build/06.prg
	cd rsrc;exomizer mem -l auto 07.prg -o ../build/07.prg
	cd rsrc;exomizer mem -l auto 08.prg -o ../build/08.prg
	cd rsrc;exomizer mem -l auto 09.prg -o ../build/09.prg
	cd rsrc;exomizer mem -l auto 10.prg -o ../build/10.prg
	cd rsrc;exomizer mem -l auto 11.prg -o ../build/11.prg
	cd rsrc;exomizer mem -l auto 12.prg -o ../build/12.prg
	cd rsrc;exomizer mem -l auto 13.prg -o ../build/13.prg
	cd rsrc;exomizer mem -l auto 14.prg -o ../build/14.prg
	cd rsrc;exomizer mem -l auto 15.prg -o ../build/15.prg
	cd rsrc;exomizer mem -l auto 16.prg -o ../build/16.prg
	cd rsrc;exomizer mem -l auto 17.prg -o ../build/17.prg
	cd rsrc;exomizer mem -l auto 18.prg -o ../build/18.prg
	cd rsrc;exomizer mem -l auto 19.prg -o ../build/19.prg
	cd rsrc;exomizer mem -l auto 20.prg -o ../build/20.prg
	cd rsrc;exomizer mem -l auto 21.prg -o ../build/21.prg
	cd rsrc;exomizer mem -l auto 22.prg -o ../build/22.prg
	cd rsrc;exomizer mem -l auto 23.prg -o ../build/23.prg
	cd rsrc;exomizer mem -l auto 24.prg -o ../build/24.prg
	cd rsrc;exomizer mem -l auto 25.prg -o ../build/25.prg
	cd rsrc;exomizer mem -l auto 26.prg -o ../build/26.prg
	cd rsrc;exomizer mem -l auto 27.prg -o ../build/27.prg
	cd rsrc;exomizer mem -l auto 28.prg -o ../build/28.prg
	cd rsrc;exomizer mem -l auto 29.prg -o ../build/29.prg
	cd rsrc;exomizer mem -l auto 30.prg -o ../build/30.prg
	cd rsrc;exomizer mem -l auto 31.prg -o ../build/31.prg
	cd rsrc;exomizer mem -l auto 32.prg -o ../build/32.prg
	cd rsrc;exomizer mem -l auto 33.prg -o ../build/33.prg
	cd rsrc;exomizer mem -l auto 34.prg -o ../build/34.prg
	cd rsrc;exomizer mem -l auto 35.prg -o ../build/35.prg
	cd rsrc;exomizer mem -l auto 36.prg -o ../build/36.prg
	cd rsrc;exomizer mem -l auto 37.prg -o ../build/37.prg
	cd rsrc;exomizer mem -l auto 38.prg -o ../build/38.prg
	cd rsrc;exomizer mem -l auto 39.prg -o ../build/39.prg
	cd rsrc;exomizer mem -l auto 40.prg -o ../build/40.prg
	cd rsrc;exomizer mem -l auto 41.prg -o ../build/41.prg
	cd rsrc;exomizer mem -l auto 42.prg -o ../build/42.prg
	cd rsrc;exomizer mem -l auto 43.prg -o ../build/43.prg
	cd rsrc;exomizer mem -l auto 44.prg -o ../build/44.prg
	cd rsrc;exomizer mem -l auto 45.prg -o ../build/45.prg
	cd rsrc;exomizer mem -l auto 46.prg -o ../build/46.prg
	cd rsrc;exomizer mem -l auto 47.prg -o ../build/47.prg
	cd rsrc;exomizer mem -l auto 48.prg -o ../build/48.prg
	cd rsrc;exomizer mem -l auto 49.prg -o ../build/49.prg
	cd rsrc;exomizer mem -l auto 50.prg -o ../build/50.prg
	cd rsrc;exomizer mem -l auto 51.prg -o ../build/51.prg
	cd rsrc;exomizer mem -l auto 52.prg -o ../build/52.prg
	cd rsrc;exomizer mem -l auto 53.prg -o ../build/53.prg
	cd rsrc;exomizer mem -l auto 54.prg -o ../build/54.prg
	cd rsrc;exomizer mem -l auto 55.prg -o ../build/55.prg
	cd rsrc;exomizer mem -l auto 56.prg -o ../build/56.prg
	cd rsrc;exomizer mem -l auto 57.prg -o ../build/57.prg
	cd rsrc;exomizer mem -l auto 58.prg -o ../build/58.prg
	cd rsrc;exomizer mem -l auto 59.prg -o ../build/59.prg
	cd rsrc;exomizer mem -l auto 60.prg -o ../build/60.prg
	cd rsrc;exomizer mem -l auto 61.prg -o ../build/61.prg
	cd rsrc;exomizer mem -l auto 62.prg -o ../build/62.prg
	cd rsrc;exomizer mem -l auto 63.prg -o ../build/63.prg
	cd rsrc;exomizer mem -l auto 64.prg -o ../build/64.prg
	cd rsrc;exomizer mem -l auto 65.prg -o ../build/65.prg
	cd rsrc;exomizer mem -l auto 66.prg -o ../build/66.prg
	cd rsrc;exomizer mem -l auto 67.prg -o ../build/67.prg
	cd rsrc;exomizer mem -l auto 68.prg -o ../build/68.prg
	cd rsrc;exomizer mem -l auto 69.prg -o ../build/69.prg
	cd rsrc;exomizer mem -l auto 70.prg -o ../build/70.prg
	cd rsrc;exomizer mem -l auto 71.prg -o ../build/71.prg
	cd rsrc;exomizer mem -l auto 72.prg -o ../build/72.prg
	cd rsrc;exomizer mem -l auto 73.prg -o ../build/73.prg
	cd rsrc;exomizer mem -l auto 74.prg -o ../build/74.prg
	cd rsrc;exomizer mem -l auto 75.prg -o ../build/75.prg
	cd rsrc;exomizer mem -l auto 76.prg -o ../build/76.prg
	cd rsrc;exomizer mem -l auto 77.prg -o ../build/77.prg
	cd rsrc;exomizer mem -l auto 78.prg -o ../build/78.prg
	cd rsrc;exomizer mem -l auto 79.prg -o ../build/79.prg
	cd rsrc;exomizer mem -l auto 80.prg -o ../build/80.prg
	cd rsrc;exomizer mem -l auto 81.prg -o ../build/81.prg
	cd rsrc;exomizer mem -l auto 82.prg -o ../build/82.prg
	cd rsrc;exomizer mem -l auto 83.prg -o ../build/83.prg
	cd rsrc;exomizer mem -l auto 84.prg -o ../build/84.prg
	cd rsrc;exomizer mem -l auto 85.prg -o ../build/85.prg
	cd rsrc;exomizer mem -l auto 86.prg -o ../build/86.prg
	cd rsrc;exomizer mem -l auto 87.prg -o ../build/87.prg
	cd rsrc;exomizer mem -l auto 88.prg -o ../build/88.prg
	cd rsrc;exomizer mem -l auto 89.prg -o ../build/89.prg
	cd rsrc;exomizer mem -l auto 90.prg -o ../build/90.prg
	cd rsrc;exomizer mem -l auto 91.prg -o ../build/91.prg
	cd rsrc;exomizer mem -l auto 92.prg -o ../build/92.prg
	cd rsrc;exomizer mem -l auto 93.prg -o ../build/93.prg
	cd rsrc;exomizer mem -l auto 94.prg -o ../build/94.prg
	cd rsrc;exomizer mem -l auto 95.prg -o ../build/95.prg
	cd rsrc;exomizer mem -l auto 96.prg -o ../build/96.prg
	cd rsrc;exomizer mem -l auto 97.prg -o ../build/97.prg
	cd rsrc;exomizer mem -l auto 98.prg -o ../build/98.prg
	cd rsrc;exomizer mem -l auto 99.prg -o ../build/99.prg

disk1.d64: ## create c64 disk demo side 1
	c1541 -format "onslaught,2a" d64 $@
	c1541 -attach $@ -write build/demo.prg "start" 
	c1541 -attach $@ -write build/aa.prg "aa"
	c1541 -attach $@ -write build/bb.prg "bb"
	c1541 -attach $@ -write build/cc.prg "cc"
	c1541 -attach $@ -write build/dd.prg "dd"
	c1541 -attach $@ -write build/ee.prg "ee"
	c1541 -attach $@ -write build/ff.prg "ff"
	c1541 -attach $@ -write build/gg.prg "gg"
	c1541 -attach $@ -write build/hh.prg "hh"
	c1541 -attach $@ -write build/ii.prg "ii"
	c1541 -attach $@ -write build/jj.prg "jj"
	c1541 -attach $@ -write build/kk.prg "kk"
	c1541 -attach $@ -write build/ll.prg "ll"
	c1541 -attach $@ -write build/mm.prg "mm"
	c1541 -attach $@ -write build/00.prg "00"
	c1541 -attach $@ -write build/01.prg "01"
	c1541 -attach $@ -write build/02.prg "02"
	c1541 -attach $@ -write build/03.prg "03"
	c1541 -attach $@ -write build/04.prg "04"
	c1541 -attach $@ -write build/05.prg "05"
	c1541 -attach $@ -write build/06.prg "06"
	c1541 -attach $@ -write build/07.prg "07"
	c1541 -attach $@ -write build/08.prg "08"
	c1541 -attach $@ -write build/09.prg "09"
	c1541 -attach $@ -write build/10.prg "10"
	c1541 -attach $@ -write build/11.prg "11"
	c1541 -attach $@ -write build/12.prg "12"
	c1541 -attach $@ -write build/13.prg "13"
	c1541 -attach $@ -write build/14.prg "14"
	c1541 -attach $@ -write build/15.prg "15"
	c1541 -attach $@ -write build/16.prg "16"
	c1541 -attach $@ -write build/17.prg "17"
	c1541 -attach $@ -write build/18.prg "18"
	c1541 -attach $@ -write build/19.prg "19"
	c1541 -attach $@ -write build/20.prg "20"
	c1541 -attach $@ -write build/21.prg "21"
	c1541 -attach $@ -write build/22.prg "22"
	c1541 -attach $@ -write build/23.prg "23"
	c1541 -attach $@ -write build/24.prg "24"
	c1541 -attach $@ -write build/25.prg "25"
	c1541 -attach $@ -write build/26.prg "26"
	c1541 -attach $@ -write build/27.prg "27"
	c1541 -attach $@ -write build/28.prg "28"
	c1541 -attach $@ -write build/29.prg "29"
	c1541 -attach $@ -write build/30.prg "30"
	c1541 -attach $@ -write build/31.prg "31"
	c1541 -attach $@ -write build/32.prg "32"
	c1541 -attach $@ -write build/33.prg "33"
	c1541 -attach $@ -write build/34.prg "34"
	c1541 -attach $@ -write build/35.prg "35"
	c1541 -attach $@ -write build/36.prg "36"
	c1541 -attach $@ -write build/37.prg "37"
	c1541 -attach $@ -write build/38.prg "38"
	c1541 -attach $@ -write build/39.prg "39"
	c1541 -attach $@ -write build/40.prg "40"
	c1541 -attach $@ -write build/41.prg "41"
	c1541 -attach $@ -write build/42.prg "42"
	c1541 -attach $@ -write build/43.prg "43"

disk2.d64: ## create c64 disk demo side 2
	c1541 -format "onslaught,2a" d64 $@
	c1541 -attach $@ -write build/44.prg "44"
	c1541 -attach $@ -write build/45.prg "45"
	c1541 -attach $@ -write build/46.prg "46"
	c1541 -attach $@ -write build/47.prg "47"
	c1541 -attach $@ -write build/48.prg "48"
	c1541 -attach $@ -write build/49.prg "49"
	c1541 -attach $@ -write build/50.prg "50"
	c1541 -attach $@ -write build/51.prg "51"
	c1541 -attach $@ -write build/52.prg "52"
	c1541 -attach $@ -write build/53.prg "53"
	c1541 -attach $@ -write build/54.prg "54"
	c1541 -attach $@ -write build/55.prg "55"
	c1541 -attach $@ -write build/56.prg "56"
	c1541 -attach $@ -write build/57.prg "57"
	c1541 -attach $@ -write build/58.prg "58"
	c1541 -attach $@ -write build/59.prg "59"
	c1541 -attach $@ -write build/60.prg "60"
	c1541 -attach $@ -write build/61.prg "61"
	c1541 -attach $@ -write build/62.prg "62"
	c1541 -attach $@ -write build/63.prg "63"
	c1541 -attach $@ -write build/64.prg "64"
	c1541 -attach $@ -write build/65.prg "65"
	c1541 -attach $@ -write build/66.prg "66"
	c1541 -attach $@ -write build/67.prg "67"
	c1541 -attach $@ -write build/68.prg "68"
	c1541 -attach $@ -write build/69.prg "69"
	c1541 -attach $@ -write build/70.prg "70"
	c1541 -attach $@ -write build/71.prg "71"
	c1541 -attach $@ -write build/72.prg "72"
	c1541 -attach $@ -write build/73.prg "73"
	c1541 -attach $@ -write build/74.prg "74"
	c1541 -attach $@ -write build/75.prg "75"
	c1541 -attach $@ -write build/76.prg "76"
	c1541 -attach $@ -write build/77.prg "77"
	c1541 -attach $@ -write build/78.prg "78"
	c1541 -attach $@ -write build/79.prg "79"
	c1541 -attach $@ -write build/80.prg "80"
	c1541 -attach $@ -write build/81.prg "81"
	c1541 -attach $@ -write build/82.prg "82"
	c1541 -attach $@ -write build/83.prg "83"
	c1541 -attach $@ -write build/84.prg "84"
	c1541 -attach $@ -write build/85.prg "85"
	c1541 -attach $@ -write build/86.prg "86"
	c1541 -attach $@ -write build/87.prg "87"
	c1541 -attach $@ -write build/88.prg "88"
	c1541 -attach $@ -write build/89.prg "89"
	c1541 -attach $@ -write build/90.prg "90"
	c1541 -attach $@ -write build/91.prg "91"
	c1541 -attach $@ -write build/92.prg "92"
	c1541 -attach $@ -write build/93.prg "93"
	c1541 -attach $@ -write build/94.prg "94"
	c1541 -attach $@ -write build/95.prg "95"
	c1541 -attach $@ -write build/96.prg "96"
	c1541 -attach $@ -write build/97.prg "97"
	c1541 -attach $@ -write build/98.prg "98"
	c1541 -attach $@ -write build/99.prg "99"

clean: ## Clean up
	rm -f src/*.sym src/*.prg *.d64 src/.source.txt src/convert_animations.asm src/convert_music.asm 
	rm -rf build

main_clean: ## Clean up enough to build main demo code
	rm -f src/*.sym src/*.prg *.d64 src/.source.txt src/convert_animations.asm src/convert_music.asm 

test: main_clean src/demo.prg disk1.d64 disk2.d64  ## Rebuild the demo code only
	echo "Done"
