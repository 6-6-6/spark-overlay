# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-interceptor-spi-2.0.0.CR1.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/interceptor/jboss-interceptor-spi/2.0.0.CR1/jboss-interceptor-spi-2.0.0.CR1-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-interceptor-spi-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JBoss EJB 3.1 Common Interceptor Library Parent"
HOMEPAGE="http://www.jboss.org/jboss-interceptor-parent/jboss-interceptor-spi"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/interceptor/${PN}/${PV}.CR1/${P}.CR1-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.interceptor:jboss-interceptor-spi:2.0.0.CR1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.CR1.pom
# org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.1_spec:1.0.0.Beta1 -> !!!artifactId-not-found!!!

DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
	!!!artifactId-not-found!!!
"

RDEPEND="
	>=virtual/jre-1.5:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="!!!artifactId-not-found!!!"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
