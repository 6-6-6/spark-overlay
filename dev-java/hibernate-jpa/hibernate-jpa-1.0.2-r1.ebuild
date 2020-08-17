# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hibernate-jpa-2.1-api-1.0.2.Final.pom --download-uri https://repo1.maven.org/maven2/org/hibernate/javax/persistence/hibernate-jpa-2.1-api/1.0.2.Final/hibernate-jpa-2.1-api-1.0.2.Final-sources.jar --slot 2.1-api --keywords "~amd64" --ebuild hibernate-jpa-1.0.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.hibernate.javax.persistence:hibernate-jpa-2.1-api:1.0.2.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Clean-room definition of JPA APIs intended for use in developing Hibernate JPA implementation.  See README.md for details"
HOMEPAGE="http://hibernate.org"
SRC_URI="https://repo1.maven.org/maven2/org/hibernate/javax/persistence/${PN}-2.1-api/${PV}.Final/${PN}-2.1-api-${PV}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/hibernate/javax/persistence/${PN}-2.1-api/${PV}.Final/${PN}-2.1-api-${PV}.Final.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0"
SLOT="2.1-api"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
