# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_PEP517=setuptools

inherit java-pkg-2 distutils-r1

DESCRIPTION="A bridge between Python and Java"
SRC_URI="https://github.com/py4j/py4j/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
HOMEPAGE="https://www.py4j.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	test? (
		dev-java/junit:4
	)
"

distutils_enable_tests pytest
EPYTEST_IGNORE=(
	# https://github.com/py4j/py4j/issues/441
	src/py4j/tests/java_tls_test.py
)

src_prepare() {
	distutils-r1_src_prepare
	# Do not install test sources
	sed -i -e 's/"py4j.tests"//g' py4j-python/setup.py ||
		die "Failed to modify setup.py to skip installation of test sources"
}

src_compile() {
	einfo "Building py4j-java"
	pushd py4j-java > /dev/null ||
		die "Failed to enter py4j-java directory"

	local java_src_dir=( src/main/java )
	local sources="sources.lst"
	local classes="target/classes"

	find "${java_src_dir[@]}" -type f -name '*.java' > "${sources}"
	mkdir -p "${classes}" || die "Failed to create directory for classes"

	ejavac -d "${classes}" "@${sources}"
	local jar="$(java-config -j)"
	"${jar}" -cf "py4j${PV}.jar" -C "${classes}" . ||
		die "Failed to create JAR for py4j-java"

	popd > /dev/null || die "Failed to leave py4j-java directory"

	pushd py4j-python > /dev/null ||
		die "Failed to enter py4j-python directory"
	# Avoid "can't copy 'py4j-java/py4j${PV}.jar'" error
	ln -s ../py4j-java ||
		die "Failed to create necessary symbolic link to py4j-java directory"
	distutils-r1_src_compile
	popd > /dev/null || die "Failed to leave py4j-python directory"
}

src_test() {
	einfo "Building py4j-java"
	pushd py4j-java > /dev/null ||
		die "Failed to enter py4j-java directory"

	local java_test_src_dir=( src/test/java )
	local sources="test-sources.lst"
	local classes="target/test-classes"

	find "${java_test_src_dir[@]}" -type f -name '*.java' > "${sources}"
	mkdir -p "${classes}" || die "Failed to create directory for classes"

	local classpath="py4j${PV}.jar:$(java-pkg_getjars junit-4)"
	ejavac -d "${classes}" -cp "${classpath}" "@${sources}"

	popd > /dev/null || die "Failed to leave py4j-java directory"

	pushd py4j-python > /dev/null ||
		die "Failed to enter py4j-python directory"
	distutils-r1_src_test
	popd > /dev/null || die "Failed to leave py4j-python directory"
}
