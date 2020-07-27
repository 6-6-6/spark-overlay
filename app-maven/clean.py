#!/usr/bin/python
# -*- coding:utf-8 -*-

import sys

cmd = "rm"
for i in sys.argv[1:]:
    if not i.endswith("r1.ebuild"):
        cmd += f" {i}"

if cmd == "rm":
    print("echo no rm")
else:
    print(cmd)
