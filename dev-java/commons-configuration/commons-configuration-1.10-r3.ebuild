# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="commons-configuration:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Tools to assist in reading of configuration/preferences files in various formats"
HOMEPAGE="https://commons.apache.org/configuration/"
SRC_URI="
	https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/log4j-12-api:2
	dev-java/xml-commons-resolver:0
	>=dev-java/commons-beanutils-1.9.2:1.7
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-collections-3.2.1:0
	dev-java/commons-digester:2.1
	>=dev-java/commons-jexl-2.1.1:2
	>=dev-java/commons-jxpath-1.3:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/commons-vfs-2.0:2
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		dev-java/sax:0
		dev-java/tomcat-servlet-api:2.4
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="sax,tomcat-servlet-api-2.4"
JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" \
		digesterRules.xml properties.dtd PropertyList-1.0.dtd ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
