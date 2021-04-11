# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/guice-servlet-3.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/inject/extensions/guice-servlet/3.0/guice-servlet-3.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/inject/extensions/guice-servlet/3.0/guice-servlet-3.0.jar --slot 0 --keywords "~amd64" --ebuild guice-servlet-3.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.inject.extensions:guice-servlet:3.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Guice is a lightweight dependency injection framework for Java 5 and above"
HOMEPAGE="http://code.google.com/p/google-guice/extensions-parent/guice-servlet/"
SRC_URI="https://repo1.maven.org/maven2/com/google/inject/extensions/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/inject/extensions/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.inject:guice:3.0 -> >=dev-java/guice-4.1:4
# com.google.inject:guice:3.0 -> >=dev-java/guice-4.1:4

CDEPEND="
	>=dev-java/guice-4.1:4
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		java-virtuals/servlet-api:4.0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guice-4,guice-4"
JAVA_CLASSPATH_EXTRA="servlet-api-4.0"
JAVA_SRC_DIR="src"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
