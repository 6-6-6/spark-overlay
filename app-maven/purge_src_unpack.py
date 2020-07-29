#!/usr/bin/python
# -*- coding:utf-8 -*-

import sys

with open(sys.argv[1]) as f:
    lines = f.readlines()

i = 0
with open(sys.argv[1], 'w') as f:
    while i < len(lines):
        if lines[i].startswith("src_unpack"):
            while(1):
                i += 1
                if lines[i].startswith("}"):
                    i += 1
                    break
        try:
            f.write(lines[i])
        except:
            pass
        i += 1
