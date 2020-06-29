# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaffl-0.5.11.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/extras/jaffl/0.5.11/jaffl-0.5.11.jar --slot 0 --keywords "~amd64" --ebuild jaffl-0.5.11.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="An abstracted interface to invoking native functions from java"
HOMEPAGE="http://github.com/wmeissner/jaffl"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/extras/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby.extras:jaffl:0.5.11"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# asm:asm:3.2 -> >=dev-java/asm-8.0.1:0
# asm:asm-commons:3.2 -> >=app-maven/asm-commons-3.3.1:0
# org.jruby.extras:jffi:1.0.6 -> >=app-maven/jffi-1.0.6:0
# org.jruby.extras:jnr-x86asm:1.0.0 -> >=app-maven/jnr-x86asm-1.0.0:0

CDEPEND="
	>=app-maven/asm-commons-3.3.1:0
	>=app-maven/jffi-1.0.6:0
	>=app-maven/jnr-x86asm-1.0.0:0
	>=dev-java/asm-8.0.1:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby.extras:jffi:1.0.6 -> >=app-maven/jffi-1.0.6:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=app-maven/jffi-1.0.6:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="asm,asm-commons,jffi,jnr-x86asm,jffi"
