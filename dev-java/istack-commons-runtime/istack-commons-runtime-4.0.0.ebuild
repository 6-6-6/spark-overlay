# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/istack-commons-runtime-4.0.0-M3.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/istack/istack-commons-runtime/4.0.0-M3/istack-commons-runtime-4.0.0-M3-sources.jar --slot 0 --keywords "~amd64" --ebuild istack-commons-runtime-4.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="istack common utility code"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/istack-commons/istack-commons-runtime"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/istack/${PN}/${PV}-M3/${P}-M3-sources.jar -> ${P}.jar
	https://repo.maven.apache.org/maven2/com/sun/istack/${PN}/${PV}-M3/${P}-M3.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.istack:istack-commons-runtime:4.0.0-M3"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M3.pom
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> >=app-maven/jakarta-activation-api-2.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	>=app-maven/jakarta-activation-api-2.0.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-activation-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	rm ${S}/${JAVA_SRC_DIR}/module-info.java || die
	rm ${S}/${JAVA_SRC_DIR}/META-INF -r || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
