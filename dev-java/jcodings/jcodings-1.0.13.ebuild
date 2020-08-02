# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jcodings-1.0.13.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/jcodings/jcodings/1.0.13/jcodings-1.0.13-sources.jar --slot 0 --keywords "~amd64" --ebuild jcodings-1.0.13.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Byte based encoding support library for java"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/jcodings"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~ppc64 ~x86-linux ~x86-solaris"
MAVEN_ID="org.jruby.jcodings:jcodings:1.0.13"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
