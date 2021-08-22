#!/usr/bin/env python3
import os
from pathlib import Path


current: Path = Path(os.path.dirname(os.path.realpath(__file__)))
root: Path = current.parent.absolute()
src: Path = root.joinpath("rsrc")
dst: Path = root.joinpath("src")
print(f"Rendering packer include...{src}")
output: Path = dst.joinpath("petscii_include.asm")
with open(output, mode="w") as o:
    count: int  = 0
    for filename in os.listdir(src):
        if filename.endswith(".prg") and filename.startswith("txt_"):
            ptr: str = str(count).rjust(2,"0")
            raw_name: str = filename.lstrip("txt_").rstrip(".prg")
            txt_filename: str = filename
            col_filename: str = "col_" + filename.lstrip("txt_")
            txt_name: str = txt_filename.strip(".prg")
            col_name: str = col_filename.strip(".prg")
            o.write(f"""
//{raw_name} : {txt_name} + {col_name}
.pc=* "{txt_name}"
txt_{ptr}:
.import c64 "rsrc/{txt_filename}"
.pc=* "{col_name}"
col_{ptr}: 
.import c64 "rsrc/{col_filename}"
"""
            )
            count += 1
            