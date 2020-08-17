# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-interceptors-api_1.1_spec-1.0.0.Beta1.pom --download-uri https://repo1.maven.org/maven2/org/jboss/spec/javax/interceptor/jboss-interceptors-api_1.1_spec/1.0.0.Beta1/jboss-interceptors-api_1.1_spec-1.0.0.Beta1-sources.jar --slot 1.1_spec --keywords "~amd64" --ebuild jboss-interceptors-api-1.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.1_spec:1.0.0.Beta1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The JavaEE Interceptors 1.1 API classes from JSR 318."
HOMEPAGE="http://jboss-interceptors-api_1.1_spec/"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/spec/javax/interceptor/${PN}_1.1_spec/${PV}.Beta1/${PN}_1.1_spec-${PV}.Beta1-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/spec/javax/interceptor/${PN}_1.1_spec/${PV}.Beta1/${PN}_1.1_spec-${PV}.Beta1.jar -> ${P}-bin.jar"
LICENSE="LGPL-3"
SLOT="1.1_spec"
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
