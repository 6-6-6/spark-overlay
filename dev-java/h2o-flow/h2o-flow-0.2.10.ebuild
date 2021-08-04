# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="ai.h2o:${PN}:${PV}"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Web based interactive computing environment for H2O"
HOMEPAGE="https://www.h2o.ai/"
SRC_URI="https://repo1.maven.org/maven2/ai/h2o/${PN}/${PV}/${P}.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# This is a package containing only HTML, CSS and JavaScript files.  The
# JavaScript files are neither compiled or preprocessed, so they can be
# easily modified.  This ebuild only extracts source files, repackages
# them into a new JAR, and installs that JAR, so users can apply their
# own patches to the web resource files.

# Unpack the source JAR for users' patching pleasure
BDEPEND="
	app-arch/unzip
"

# No Java source is compiled, no need to depend on JDK
DEPEND="
	>=virtual/jre-1.8:*
"

RDEPEND="
	${DEPEND}
"

S="${WORKDIR}"

src_compile() {
	jar cfm "${JAVA_JAR_FILENAME}" META-INF/MANIFEST.MF . || die "jar failed"
}
