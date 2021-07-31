# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jruby:jruby:1.7.22"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The effort to recreate the Ruby interpreter in Java"
HOMEPAGE="https://www.jruby.org/"
SRC_URI="https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

# The source JAR on Maven Central does not contain any source files; upstream's
# main tree has a build.xml file for Ant but it is essentially a wrapper of
# Maven, which downloads dependencies and thus cannot be used within Portage.
# Thus, this package cannot be compiled from source yet.  Nevertheless, the
# pre-built binary JAR does not contain any class file either; it only contains
# a pom.xml and a pom.properties file for unknown purpose.
IUSE="+binary"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby:jruby-core:1.7.22 -> >=dev-java/jruby-core-1.7.22:0
# org.jruby:jruby-stdlib:1.7.22 -> >=dev-java/jruby-stdlib-1.7.22:0

CDEPEND="
	>=dev-java/jruby-core-1.7.22:0
	>=dev-java/jruby-stdlib-1.7.22:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_ENCODING="utf-8"

JAVA_GENTOO_CLASSPATH="jruby-core,jruby-stdlib"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
