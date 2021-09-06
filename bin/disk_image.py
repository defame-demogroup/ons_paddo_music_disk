#!/usr/bin/env python3
import os
from pathlib import Path
import glob


current: Path = Path(os.path.dirname(os.path.realpath(__file__)))
root: Path = current.parent.absolute()
src: Path = root.joinpath("rsrc")
music_filenames = []
for i in range(100):
    music_filenames.append(str(i).rjust(2,"0"))
gfx_filenames = ["aa","bb","cc","dd","ee","ff","gg","hh","ii","jj","kk","ll","mm"]
print(f"Rendering Makefile fragment...{src}")
output: Path = src.joinpath("makefile_fragement.txt")

# filenames = sorted( filter( os.path.isfile, glob.glob(str(src.joinpath("*.prg")))))

with open(output, mode="w") as o:
    for filename in gfx_filenames:
        o.write(f"	cd rsrc;exomizer mem -l auto {filename}.prg -o ../build/{filename}.prg\n")

    for filename in music_filenames:
        o.write(f"	cd rsrc;exomizer mem -l auto {filename}.prg -o ../build/{filename}.prg\n")

    for filename in gfx_filenames:
        o.write(f"	c1541 -attach $@ -write build/{filename}.prg \"{filename}\"\n")

    for filename in music_filenames:
        o.write(f"	c1541 -attach $@ -write build/{filename}.prg \"{filename}\"\n")

