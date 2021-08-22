#!/usr/bin/env python3
import os
from pathlib import Path


current: Path = Path(os.path.dirname(os.path.realpath(__file__)))
root: Path = current.parent.absolute()
src: Path = root.joinpath("rsrc")
print(f"Rendering Makefile fragment...{src}")
output: Path = src.joinpath("makefile_fragement.txt")
with open(output, mode="w") as o:
    count: int  = 0
    for i in range(100):
        name: str = str(i).rjust(2,"0")
        filename: str = name + ".prg"
        o.write(f"	c1541 -attach $@ -write rsrc/{filename} \"{name}\"\n")
    # Don't use this as it puts the filenames out of order
    # BUT - If you add more songs, you need to make bigger number!
    # for filename in os.listdir(src):
    #     if filename.endswith(".prg") and filename[0].isnumeric():
    #         name: str = filename.strip(".sid")
    #         o.write(f"	c1541 -attach $@ -write rsrc/{filename} \"{name}\"\n")
    #         count += 1
    #     else:
    #         continue
