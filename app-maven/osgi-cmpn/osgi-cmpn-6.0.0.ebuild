# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/osgi.cmpn-6.0.0.pom --download-uri https://repo1.maven.org/maven2/org/osgi/osgi.cmpn/6.0.0/osgi.cmpn-6.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild osgi-cmpn-6.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Compendium Release 6, Interfaces and Classes for use in compiling bundles."
HOMEPAGE="http://www.osgi.org/"
SRC_URI="https://repo1.maven.org/maven2/org/osgi/osgi.cmpn/${PV}/osgi.cmpn-${PV}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/osgi/osgi.cmpn/${PV}/osgi.cmpn-${PV}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="6"
KEYWORDS="~amd64"
MAVEN_ID="org.osgi:osgi.cmpn:6.0.0"

CDEPEND="
	dev-java/osgi-annotation:6
	dev-java/osgi-framework:6

	dev-java/glassfish-persistence:0
	java-virtuals/servlet-api:4.0
	app-maven/microemu-cldc:0
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

JAVA_GENTOO_CLASSPATH="osgi-annotation-6,osgi-framework-6,servlet-api-4.0,glassfish-persistence,microemu-cldc"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
