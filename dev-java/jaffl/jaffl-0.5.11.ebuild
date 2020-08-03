# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaffl-0.5.11.pom --download-uri https://repo1.maven.org/maven2/org/jruby/extras/jaffl/0.5.11/jaffl-0.5.11.jar --slot 0 --keywords "~amd64" --ebuild jaffl-0.5.11.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.jruby.extras:jaffl:0.5.11"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="An abstracted interface to invoking native functions from java"
HOMEPAGE="http://github.com/wmeissner/jaffl"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/extras/${PN}/${PV}/${P}.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# asm:asm:3.2 -> >=dev-java/asm-8.0.1:4
# asm:asm-commons:3.2 -> >=dev-java/asm-8.0.1:4
# org.jruby.extras:jffi:1.0.6 -> >=dev-java/jffi-1.0.6:0
# org.jruby.extras:jnr-x86asm:1.0.0 -> >=dev-java/jnr-x86asm-1.0.0:0

CDEPEND="
	>=dev-java/jffi-1.0.6:0
	>=dev-java/jnr-x86asm-1.0.0:0
	>=dev-java/asm-3.3.1:3"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby.extras:jffi:1.0.6 -> >=dev-java/jffi-1.0.6:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=dev-java/jffi-1.0.6:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="asm-3,jffi,jnr-x86asm,jffi"
JAVA_SRC_DIR="src/main/java"
