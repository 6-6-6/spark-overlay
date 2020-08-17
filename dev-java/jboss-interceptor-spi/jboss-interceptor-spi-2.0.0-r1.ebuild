# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-interceptor-spi-2.0.0.CR1.pom --download-uri https://repo1.maven.org/maven2/org/jboss/interceptor/jboss-interceptor-spi/2.0.0.CR1/jboss-interceptor-spi-2.0.0.CR1-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-interceptor-spi-2.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.interceptor:jboss-interceptor-spi:2.0.0.CR1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JBoss EJB 3.1 Common Interceptor Library Parent"
HOMEPAGE="http://www.jboss.org/jboss-interceptor-parent/jboss-interceptor-spi"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/interceptor/${PN}/${PV}.CR1/${P}.CR1-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/interceptor/${PN}/${PV}.CR1/${P}.CR1.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.CR1.pom
# org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.1_spec:1.0.0.Beta1 -> >=dev-java/jboss-interceptors-api-1.0.0:1.1_spec

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		>=dev-java/jboss-interceptors-api-1.0.0:1.1_spec
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jboss-interceptors-api-1.1_spec"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
