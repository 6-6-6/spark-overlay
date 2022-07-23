# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-interceptor-core-2.0.0.CR1.pom --download-uri https://repo1.maven.org/maven2/org/jboss/interceptor/jboss-interceptor-core/2.0.0.CR1/jboss-interceptor-core-2.0.0.CR1-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-interceptor-core-2.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.interceptor:jboss-interceptor-core:2.0.0.CR1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JBoss EJB 3.1 Common Interceptor Library Parent"
HOMEPAGE="http://www.jboss.org/jboss-interceptor-parent/jboss-interceptor-core"
SRC_URI="
	https://repo1.maven.org/maven2/org/jboss/interceptor/${PN}/${PV}.CR1/${P}.CR1-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/interceptor/${PN}/${PV}.CR1/${P}.CR1.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.CR1.pom
# com.google.guava:guava:r06 -> >=dev-java/guava-29.0:0
# javassist:javassist:3.12.0.GA -> >=dev-java/javassist-3.21.0:3
# org.jboss.interceptor:jboss-interceptor-spi:2.0.0.CR1 -> >=dev-java/jboss-interceptor-spi-2.0.0:0
# org.slf4j:slf4j-api:1.5.6 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/jboss-interceptor-spi-2.0.0:0
	>=dev-java/guava-29.0:0
	>=dev-java/javassist-3.21.0:3
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.CR1.pom
# org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.1_spec:1.0.0.Beta1 -> >=dev-java/jboss-interceptors-api-1.0.0:1.1_spec

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/jboss-interceptors-api-1.0.0:1.1_spec
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava,javassist-3,jboss-interceptor-spi,slf4j-api"
JAVA_CLASSPATH_EXTRA="jboss-interceptors-api-1.1_spec"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	if ! use binary; then
		eapply "${FILESDIR}/${P}-migrate-from-deprecated-API.patch"
		eapply "${FILESDIR}/${P}-update-for-javassist-3.23+.patch"
	fi

	eapply_user
}
