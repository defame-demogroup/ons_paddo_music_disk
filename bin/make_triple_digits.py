#!/usr/bin/env python3
import os
from pathlib import Path
"""
Quick tool I hacked together to visualise the PETSCII while in a text editor. 
Purely for convenience in the development process.
This code is not part of the build pipeline! 
"""

current: Path = Path(os.path.dirname(os.path.realpath(__file__)))
root: Path = current.parent.absolute()
graphics_source = root.joinpath("assets/graphics")
print(f"Converting C files to allow hex editing... {graphics_source}")
for filename in os.listdir(graphics_source):
    if filename.endswith(".c"):
        name: str = filename.strip(".c")
        working: Path = graphics_source.joinpath(filename)
        # dest: Path = graphics_source.joinpath(f"fixed_{filename}")
        lines: list = []
        with open(working, mode="r") as f:
            lines: list = f.readlines()
        
        output: list = []
        for row in lines:
            items = row.split(",")
            row_output: list = list()
            for item in items:
                if item.isnumeric():
                    row_output.append(item.rjust(3,"0"))
                else:
                    row_output.append(item)
            output.append(",".join(row_output))

        with open(working, mode="w") as f:
            f.writelines(output)
