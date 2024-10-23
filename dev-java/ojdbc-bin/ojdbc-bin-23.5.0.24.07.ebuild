# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom ojdbc11-23.5.0.24.07.pom --download-uri https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc11/23.5.0.24.07/ojdbc11-23.5.0.24.07-sources.jar --slot 0 --keywords "~amd64" --ebuild ojdbc-23.5.0.24.07.ebuild

EAPI=7

JAVA_PKG_IUSE="binary doc"
MAVEN_ID="com.oracle.database.jdbc:ojdbc11:23.5.0.24.07"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Oracle JDBC Driver compatible with JDK11, JDK17, JDK19, and JDK21"
HOMEPAGE="https://www.oracle.com/database/technologies/maven-central-guide.html"
SRC_URI="https://repo1.maven.org/maven2/com/oracle/database/jdbc/${PN/-bin/}11/${PV}/${PN/-bin/}11-${PV}.jar -> ${P}.jar"
LICENSE="!!!equivalentPortageLicenseName-not-found!!!"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-11:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-11:*
"

S="${WORKDIR}"

JAVA_BINJAR_FILENAME=${P}.jar

pkg_setup() {
	use binary || die "binary only package"
}
