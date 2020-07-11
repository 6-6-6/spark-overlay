# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.persistence-2.1.0.pom --download-uri https://repo1.maven.org/maven2/org/eclipse/persistence/javax.persistence/2.1.0/javax.persistence-2.1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild javax-persistence-2.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="EclipseLink build based upon Git transaction 3faac2b"
HOMEPAGE="http://www.eclipse.org/eclipselink"
SRC_URI="https://repo1.maven.org/maven2/org/eclipse/persistence/javax.persistence/${PV}/javax.persistence-${PV}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/eclipse/persistence/javax.persistence/${PV}/javax.persistence-${PV}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.persistence:javax.persistence:2.1.0"

CDEPEND="
	dev-java/osgi-framework:6
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="osgi-framework-6"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
