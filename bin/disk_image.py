#!/usr/bin/env python3
import os
from pathlib import Path
import glob


current: Path = Path(os.path.dirname(os.path.realpath(__file__)))
root: Path = current.parent.absolute()
src: Path = root.joinpath("rsrc")
print(f"Rendering Makefile fragment...{src}")
output: Path = src.joinpath("makefile_fragement.txt")
filenames = sorted( filter( os.path.isfile, glob.glob(str(src.joinpath("*.prg")))))
with open(output, mode="w") as o:
    for filename in filenames:
        txt_filename: str = os.path.basename(filename)
        name: str = txt_filename.strip(".prg")
        o.write(f"	c1541 -attach $@ -write rsrc/{txt_filename} \"{name}\"\n")
    for filename in filenames:
        txt_filename: str = os.path.basename(filename)
        name: str = txt_filename.strip(".prg")
        o.write(f"	cd rsrc;exomizer mem -c -l auto -o ../src/{txt_filename} {txt_filename}\n")


