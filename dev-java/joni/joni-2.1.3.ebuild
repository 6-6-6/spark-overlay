# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/joni-2.1.3.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/joni/joni/2.1.3/joni-2.1.3-sources.jar --slot 2.1 --keywords "~amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~x86-solaris" --ebuild joni-2.1.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.jruby.joni:joni:2.1.3"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java port of Oniguruma: http://www.geocities.jp/kosako3/oniguruma that uses byte arrays directly instead of java Strings and chars"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/joni"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE="MIT"
SLOT="2.1"
KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~x86-solaris"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby.jcodings:jcodings:1.0.8 -> >=dev-java/jcodings-1.0.11:1

CDEPEND="
	>=dev-java/jcodings-1.0.11:1
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.ow2.asm:asm:4.0 -> >=dev-java/asm-5.0.3:4

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
	>=dev-java/asm-5.0.3:4
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jcodings-1"
JAVA_CLASSPATH_EXTRA="asm-4"
