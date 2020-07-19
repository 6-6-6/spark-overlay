#!/usr/bin/python
# -*- coding:utf-8 -*-

import json

def import_LUT(src):
    with open(src) as srcf:
        return json.loads(srcf.read())

def export_LUT(LUT, dst):
    with open(dst, 'w') as dstf:
        dstf.write(json.dumps(LUT))

def lookup(LUT, category, pkg, SLOT):
    try:
        return LUT[category][pkg][SLOT]
    except:
        return []

def insert_pkg(LUT, category, pkg, SLOT, groupId, artifactId):
    if category not in LUT.keys():
        LUT[category] = {}
    if pkg not in LUT[category].keys():
        LUT[category][pkg] = {}
    if SLOT not in LUT[category][pkg].keys():
        LUT[category][pkg][SLOT] = []
    if [groupId, artifactId] not in LUT[category][pkg][SLOT]:
        LUT[category][pkg][SLOT].append([groupId, artifactId])

