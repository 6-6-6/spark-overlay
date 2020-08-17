# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-marshalling-1.4.11.Final.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/jboss/marshalling/jboss-marshalling/1.4.11.Final/jboss-marshalling-1.4.11.Final-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/jboss/marshalling/jboss-marshalling/1.4.11.Final/jboss-marshalling-1.4.11.Final.jar --slot 0 --keywords "~amd64" --ebuild jboss-marshalling-1.4.11.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.marshalling:jboss-marshalling:1.4.11.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JBoss Marshalling API"
HOMEPAGE="http://www.jboss.org/jboss-marshalling-parent/jboss-marshalling"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/marshalling/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/marshalling/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.jboss.modules:jboss-modules:1.1.0.Beta1 -> >=dev-java/jboss-modules-1.3.3:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		>=dev-java/jboss-modules-1.3.3:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jboss-modules"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
