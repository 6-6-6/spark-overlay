# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-jms-api_1.1_spec-1.0.1.Final.pom --download-uri https://repo1.maven.org/maven2/org/jboss/spec/javax/jms/jboss-jms-api_1.1_spec/1.0.1.Final/jboss-jms-api_1.1_spec-1.0.1.Final-sources.jar --slot 1.1_spec --keywords "~amd64" --ebuild jboss-jms-api-1.0.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.spec.javax.jms:jboss-jms-api_1.1_spec:1.0.1.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JSR-000914: Java(TM) Message Service (JMS) 1.1 API"
HOMEPAGE="http://www.jboss.org/jboss-jms-api_1.1_spec"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/spec/javax/jms/${PN}_1.1_spec/${PV}.Final/${PN}_1.1_spec-${PV}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/spec/javax/jms/${PN}_1.1_spec/${PV}.Final/${PN}_1.1_spec-${PV}.Final.jar -> ${P}-bin.jar"
LICENSE="CDDL GPL-2-with-classpath-exception"
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
