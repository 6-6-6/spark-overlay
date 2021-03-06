# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-container-servlet-2.29.1.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/jersey/containers/jersey-container-servlet/2.29.1/jersey-container-servlet-2.29.1-sources.jar --slot 2 --keywords "~amd64" --ebuild jersey-container-servlet-2.29.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.glassfish.jersey.containers:jersey-container-servlet:2.29.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jersey core Servlet 3.x implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/project/jersey-container-servlet"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/jersey/containers/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/jersey/containers/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0 public-domain MIT CC0-1.0 GPL-2-with-classpath-exception W3C BSD EPL-1.0 EPL-2.0 BSD-2"
SLOT="2"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jakarta.ws.rs:jakarta.ws.rs-api:2.1.6 -> java-virtuals/ws-rs-api:0
# org.glassfish.jersey.containers:jersey-container-servlet-core:2.29.1 -> >=dev-java/jersey-container-servlet-core-2.29.1:2
# org.glassfish.jersey.core:jersey-common:2.29.1 -> >=dev-java/jersey-common-2.29.1:2
# org.glassfish.jersey.core:jersey-server:2.29.1 -> >=dev-java/jersey-server-2.29.1:2

CDEPEND="
	>=dev-java/jersey-common-2.29.1:2
	>=dev-java/jersey-container-servlet-core-2.29.1:2
	>=dev-java/jersey-server-2.29.1:2
	java-virtuals/ws-rs-api:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jakarta.servlet:jakarta.servlet-api:4.0.3 -> >=dev-java/jakarta-servlet-api-4.0.3:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/jakarta-servlet-api-4.0.3:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="ws-rs-api,jersey-container-servlet-core-2,jersey-common-2,jersey-server-2"
JAVA_CLASSPATH_EXTRA="jakarta-servlet-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
