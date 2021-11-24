#!/usr/bin/env python3
import os
from pathlib import Path
"""
Quick tool I hacked together to get masking applied to the petscii art so we can use it in the RLE packer with transparency
This is not part of the build pipeline! 
"""


filenames_to_include: list = ["zz_ls","skullrotate","player_door","dooropen","moreskulls","drummer","circlefx","sk"]


def matched_filename(src: str):
    for filename in filenames_to_include:
        if filename in src:
            return True
    return False


current: Path = Path(os.path.dirname(os.path.realpath(__file__)))
root: Path = current.parent.absolute()
graphics_source = root.joinpath("assets/graphics")
print(f"Applying transparency masking... {graphics_source}")
for filename in os.listdir(graphics_source):
    if filename.endswith(".c") and matched_filename(filename):
        name: str = filename.strip(".c")
        working: Path = graphics_source.joinpath(filename)
        dest: Path = graphics_source.joinpath(f"masked_{filename}")
        lines: list = []
        with open(working, mode="r") as f:
            lines: list = f.readlines()
        
        output: list = []
        x=0
        y=0
        for row in lines:
            y += 1
            x = 0
            items = row.split(",")
            row_output: list = list()
            for item in items:
                if item.strip().isnumeric():
                    if (y > 5 and y < 18 and x > 17 and x < 34) or (y > 30 and y < 43 and x > 17 and x < 34):
                        row_output.append(item.rjust(3,"0"))
                    else:
                        if item.endswith("\n"):
                            row_output.append("254\n")
                        else:
                            row_output.append("254")
                    x += 1
                else:
                    row_output.append(item)
            output.append(",".join(row_output))

        with open(working, mode="w") as f:
            f.writelines(output)
