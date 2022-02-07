# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit kotlin-core-deps

KEYWORDS="~amd64"

DEPEND="
	~dev-java/kotlin-stdlib-${PV}:${SLOT}
	dev-java/jetbrains-annotations:13
	>=dev-java/kotlin-protobuf-lite-2.6.1:0
"

JAVA_CLASSPATH_EXTRA="
	kotlin-stdlib-${SLOT}
	jetbrains-annotations-13
	kotlin-protobuf-lite
"
