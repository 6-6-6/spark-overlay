# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KOTLIN_CORE_DEPS_MODULE_NAME="util.runtime"

inherit kotlin-core-deps

KEYWORDS="~amd64"

DEPEND="
	~dev-java/kotlin-stdlib-${PV}:${SLOT}
	dev-java/jetbrains-annotations:13
"

JAVA_CLASSPATH_EXTRA="
	kotlin-stdlib-${SLOT}
	jetbrains-annotations-13
"
