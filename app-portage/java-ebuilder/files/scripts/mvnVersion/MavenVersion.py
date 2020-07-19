#!/usr/bin/python
# -*- coding:utf-8 -*-

import re

MAVEN_VERSION="^v?(\\d+)(?:\\.(\\d+))?(?:(?:\\.|b|beta)(\\d+))?(?:[\\.-]?(.*))?$"
MAVEN_RANGE="[\\[\\(](.*), ?(.*?)[\\]\\)]"

class MavenSingleVersion():

    def __init__(self, version_string):
        self.version = []
        version_match = re.match(MAVEN_VERSION, version_string)
        for i in range(1, 4):
            tmp = 0 if isinstance(version_match[i], type(None)) else int(version_match[i])
            self.version.append(tmp)

    def __lt__(self, alien):
        for i in range(3):
            if self.version[i] == alien.version[i]:
                continue
            else:
                return self.version[i] < alien.version[i]
        return False

    def __gt__(self, alien):
        for i in range(3):
            if self.version[i] == alien.version[i]:
                continue
            else:
                return self.version[i] > alien.version[i]
        return False

    def __le__(self, alien):
        for i in range(3):
            if self.version[i] == alien.version[i]:
                continue
            else:
                return self.version[i] < alien.version[i]
        return True

    def __ge__(self, alien):
        for i in range(3):
            if self.version[i] == alien.version[i]:
                continue
            else:
                return self.version[i] > alien.version[i]
        return True

    def __eq__(self, alien):
        for i in range(3):
            if self.version[i] == alien.version[i]:
                continue
            else:
                return False
        return True


class MavenVersion():
    def __init__(self, version_string):
        range_match = re.match(MAVEN_RANGE, version_string)

        if isinstance(range_match, type(None)):
            self.min = MavenSingleVersion(version_string)
            self.max = MavenSingleVersion("99999999.99999999.99999999")
        else:
            try:
                self.min = MavenSingleVersion(range_match.group(1))
            except:
                self.min = MavenSingleVersion("0.0.0")
            try:
                self.max = MavenSingleVersion(range_match.group(2))
            except:
                self.max = MavenSingleVersion("99999999.99999999.99999999")

    def match(self, singleVersion):
        if singleVersion <= self.max and singleVersion >= self.min:
            return True
        else:
            return False

