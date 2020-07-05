# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.inject-2.6.1.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/hk2/external/jakarta.inject/2.6.1/jakarta.inject-2.6.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-inject-2.6.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Injection API (JSR 330) version ${javax.inject.version} repackaged as OSGi bundle"
HOMEPAGE="https://github.com/eclipse-ee4j/glassfish-hk2/external/jakarta.inject"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/hk2/external/jakarta.inject/${PV}/jakarta.inject-${PV}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.hk2.external:jakarta.inject:2.6.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.inject-${PV}.pom
# javax.inject:javax.inject:1 -> >=dev-java/javax-inject-1:0

CDEPEND="
	>=dev-java/javax-inject-1:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="javax-inject"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
