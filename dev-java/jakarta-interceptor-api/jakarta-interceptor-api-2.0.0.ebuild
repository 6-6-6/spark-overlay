# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.interceptor-api-2.0.0-RC1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/jakarta/interceptor/jakarta.interceptor-api/2.0.0-RC1/jakarta.interceptor-api-2.0.0-RC1-sources.jar --binjar-uri https://repo1.maven.org/maven2/jakarta/interceptor/jakarta.interceptor-api/2.0.0-RC1/jakarta.interceptor-api-2.0.0-RC1.jar --slot 0 --keywords "~amd64" --ebuild jakarta-interceptor-api-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="jakarta.interceptor:jakarta.interceptor-api:2.0.0-RC1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jakarta Interceptors defines a means of interposing on business method invocations and specific events—such as lifecycle events and timeout events—that occur on instances of Jakarta EE components and other managed classes."
HOMEPAGE="https://github.com/eclipse-ee4j/interceptor-api"
SRC_URI="https://repo1.maven.org/maven2/jakarta/interceptor/jakarta.interceptor-api/${PV}-RC1/jakarta.interceptor-api-${PV}-RC1-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/jakarta/interceptor/jakarta.interceptor-api/${PV}-RC1/jakarta.interceptor-api-${PV}-RC1.jar -> ${P}-bin.jar"
LICENSE="EPL-2.0 GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.interceptor-api-${PV}-RC1.pom
# jakarta.annotation:jakarta.annotation-api:1.3.5 -> >=dev-java/jakarta-annotation-api-1.3.5:0

CDEPEND="
	>=dev-java/jakarta-annotation-api-1.3.5:0
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

JAVA_GENTOO_CLASSPATH="jakarta-annotation-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
