# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hibernate-commons-annotations-5.0.1.Final.pom --download-uri https://repo1.maven.org/maven2/org/hibernate/common/hibernate-commons-annotations/5.0.1.Final/hibernate-commons-annotations-5.0.1.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild hibernate-commons-annotations-5.0.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.hibernate.common:hibernate-commons-annotations:5.0.1.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Common reflection code used in support of annotation processing"
HOMEPAGE="http://hibernate.org"
SRC_URI="https://repo1.maven.org/maven2/org/hibernate/common/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/hibernate/common/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.jboss.logging:jboss-logging:3.3.0.Final -> >=dev-java/jboss-logging-3.4.0:0

CDEPEND="
	>=dev-java/jboss-logging-3.4.0:0
	dev-java/jboss-logging-annotations:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jboss-logging,jboss-logging-annotations"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
