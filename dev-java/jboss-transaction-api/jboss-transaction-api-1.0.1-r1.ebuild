# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-transaction-api_1.2_spec-1.0.1.Final.pom --download-uri https://repo1.maven.org/maven2/org/jboss/spec/javax/transaction/jboss-transaction-api_1.2_spec/1.0.1.Final/jboss-transaction-api_1.2_spec-1.0.1.Final-sources.jar --slot 1.2_spec --keywords "~amd64" --ebuild jboss-transaction-api-1.0.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.spec.javax.transaction:jboss-transaction-api_1.2_spec:1.0.1.Final"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Java Transaction 1.2 API classes"
HOMEPAGE="http://www.jboss.org/jboss-transaction-api_1.2_spec"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/spec/javax/transaction/${PN}_1.2_spec/${PV}.Final/${PN}_1.2_spec-${PV}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/spec/javax/transaction/${PN}_1.2_spec/${PV}.Final/${PN}_1.2_spec-${PV}.Final.jar -> ${P}-bin.jar"
LICENSE="CDDL GPL-2-with-classpath-exception"
SLOT="1.2_spec"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_1.2_spec-${PV}.Final.pom
# javax.enterprise:cdi-api:1.2 -> >=dev-java/cdi-api-1.2:1.2
# org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.2_spec:1.0.0.Final -> >=dev-java/jboss-interceptors-api-1.0.1:1.2_spec

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	>=dev-java/jboss-interceptors-api-1.0.1:1.2_spec
	>=dev-java/cdi-api-1.2:1.2
	)
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="cdi-api-1.2,jboss-interceptors-api-1.2_spec"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
