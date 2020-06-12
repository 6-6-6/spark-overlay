# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.interceptor-api-2.0.0-RC2.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/interceptor/jakarta.interceptor-api/2.0.0-RC2/jakarta.interceptor-api-2.0.0-RC2-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-interceptor-api-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Interceptors defines a means of interposing on business method invocations
        and specific events—such as lifecycle events and timeout events—that occur on instances
        of Jakarta EE components and other managed classes."
HOMEPAGE="https://github.com/eclipse-ee4j/interceptor-api"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/interceptor/jakarta.interceptor-api/${PV}-RC2/jakarta.interceptor-api-${PV}-RC2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.interceptor:jakarta.interceptor-api:2.0.0-RC2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.interceptor-api-${PV}-RC2.pom
# jakarta.annotation:jakarta.annotation-api:2.0.0-RC1 -> >=app-maven/jakarta-annotation-api-2.0.0:0

CDEPEND="
	>=app-maven/jakarta-annotation-api-2.0.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-annotation-api"
