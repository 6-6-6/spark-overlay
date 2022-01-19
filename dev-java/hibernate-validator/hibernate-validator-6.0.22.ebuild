# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.hibernate.validator:${PN}:${PV}.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PV="${PV}.Final"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Hibernate's Bean Validation (JSR-380) reference implementation"
HOMEPAGE="https://hibernate.org/validator/"
SRC_URI="
	https://repo1.maven.org/maven2/org/hibernate/validator/${PN}/${MY_PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/hibernate/validator/${PN}/${MY_PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Pre-built JAR includes two *.i18n.properties files not in the source JAR,
# failing pkgdiff JAR content comparison
RESTRICT="test"

CP_DEPEND="
	>=dev-java/hibernate-jpa-1.0.2:2.1-api
	>=dev-java/money-api-1.0.1:0
	>=dev-java/paranamer-2.8:0
	>=dev-java/classmate-1.5.1:0
	>=dev-java/jboss-logging-3.4.0:0
	>=dev-java/joda-time-2.9.7:0
	>=dev-java/jsoup-1.8.3:0
	>=dev-java/validation-api-2.0.1:0
	dev-java/jaxb-api:2
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		dev-java/openjfx:8
		>=dev-java/javax-el-3.0.1_beta09:0
		>=dev-java/jboss-logging-annotations-2.1.0:0
		>=dev-java/jboss-logging-processor-2.1.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="
	javax-el
	jboss-logging-annotations
	jboss-logging-processor
"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

pkg_setup() {
	java-pkg-2_pkg_setup
	# OpenJFX 8 is installed into the home of dev-java/openjdk:8
	local java_home="$(
		eval "$(java-config -P openjdk-8)"
		echo "${JAVA_HOME}"
	)"
	JAVA_GENTOO_CLASSPATH_EXTRA="${java_home}/jre/lib/ext/jfxrt.jar"
}
