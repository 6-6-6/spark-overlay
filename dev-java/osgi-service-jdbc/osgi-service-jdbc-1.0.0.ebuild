# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.osgi.service.jdbc-1.0.0.pom --download-uri https://repo1.maven.org/maven2/org/osgi/org.osgi.service.jdbc/1.0.0/org.osgi.service.jdbc-1.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild org-osgi-service-jdbc-1.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Companion Code for org.osgi.service.jdbc Version 1.0.0."
HOMEPAGE="http://www.osgi.org/"
SRC_URI="https://repo1.maven.org/maven2/org/osgi/org.osgi.service.jdbc/${PV}/org.osgi.service.jdbc-${PV}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/osgi/org.osgi.service.jdbc/${PV}/org.osgi.service.jdbc-${PV}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.osgi:org.osgi.service.jdbc:1.0.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
