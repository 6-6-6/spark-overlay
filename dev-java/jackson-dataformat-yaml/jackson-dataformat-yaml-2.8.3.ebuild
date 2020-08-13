# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-dataformat-yaml-2.8.3.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.8.3/jackson-dataformat-yaml-2.8.3-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.8.3/jackson-dataformat-yaml-2.8.3.jar --slot 0 --keywords "~amd64" --ebuild jackson-dataformat-yaml-2.8.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="com.fasterxml.jackson.dataformat:jackson-dataformat-yaml:2.8.3"
DESCRIPTION="Support for reading and writing YAML-encoded data via Jackson abstractions."
HOMEPAGE="https://github.com/FasterXML/jackson"
SRC_URI="https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/fasterxml/jackson/dataformat/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.8.3 -> >=dev-java/jackson-2.9.10:2
# org.yaml:snakeyaml:1.15 -> >=dev-java/snakeyaml-1.16:0

CDEPEND="
	>=dev-java/jackson-2.9.10:2
	>=dev-java/snakeyaml-1.16:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.8.3 -> >=dev-java/jackson-databind-2.10.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/jackson-databind-2.10.0:0
	)
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-2,snakeyaml"
JAVA_CLASSPATH_EXTRA="jackson-databind"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
