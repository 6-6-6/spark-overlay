# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hk2-locator-2.6.1.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/hk2/hk2-locator/2.6.1/hk2-locator-2.6.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hk2-locator-2.6.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="ServiceLocator Default Implementation"
HOMEPAGE="https://github.com/eclipse-ee4j/glassfish-hk2/hk2-locator"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/hk2/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.hk2:hk2-locator:2.6.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jakarta.annotation:jakarta.annotation-api:1.3.4 -> >=app-maven/jakarta-annotation-api-1.3.5:0
# org.glassfish.hk2:hk2-api:2.6.1 -> >=app-maven/hk2-api-2.6.1:0
# org.glassfish.hk2:hk2-utils:2.6.1 -> >=app-maven/hk2-utils-2.6.1:0
# org.glassfish.hk2.external:aopalliance-repackaged:2.6.1 -> >=app-maven/aopalliance-repackaged-2.6.1:0
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=app-maven/jakarta-inject-2.6.1:0
# org.javassist:javassist:3.22.0-CR2 -> >=dev-java/javassist-3.21.0:3

CDEPEND="
	>=app-maven/aopalliance-repackaged-2.6.1:0
	>=app-maven/hk2-api-2.6.1:0
	>=app-maven/hk2-utils-2.6.1:0
	>=app-maven/jakarta-annotation-api-1.3.5:0
	>=app-maven/jakarta-inject-2.6.1:0
	>=dev-java/javassist-3.21.0:3
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

JAVA_GENTOO_CLASSPATH="jakarta-annotation-api,hk2-api,hk2-utils,aopalliance-repackaged,jakarta-inject,javassist-3"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
