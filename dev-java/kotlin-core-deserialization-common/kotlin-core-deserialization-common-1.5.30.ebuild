# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KOTLIN_CORE_DEPS_MODULE_NAME="deserialization.common"

inherit kotlin-core-deps

KEYWORDS="~amd64"

DEPEND="
	~dev-java/kotlin-annotations-jvm-${PV}:${SLOT}
	~dev-java/kotlin-core-compiler-common-${PV}:${SLOT}
	~dev-java/kotlin-core-metadata-${PV}:${SLOT}
	~dev-java/kotlin-core-util-runtime-${PV}:${SLOT}
	~dev-java/kotlin-stdlib-${PV}:${SLOT}
	dev-java/jetbrains-annotations:13
	>=dev-java/kotlin-protobuf-lite-2.6.1:0
"

JAVA_CLASSPATH_EXTRA="
	kotlin-annotations-jvm-${SLOT}
	kotlin-core-compiler-common-${SLOT}
	kotlin-core-metadata-${SLOT}
	kotlin-core-util-runtime-${SLOT}
	kotlin-stdlib-${SLOT}
	jetbrains-annotations-13
	kotlin-protobuf-lite
"
