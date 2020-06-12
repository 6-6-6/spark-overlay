# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-module-paranamer-2.11.0.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/jackson/module/jackson-module-paranamer/2.11.0/jackson-module-paranamer-2.11.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-module-paranamer-2.11.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="AnnotationIntrospectors that use Paranamer (http://paranamer.codehaus.org)
to introspect names of constructor (and factory method) parameters."
HOMEPAGE="https://github.com/FasterXML/jackson-modules-base"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/jackson/module/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.module:jackson-module-paranamer:2.11.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.11.0 -> >=dev-java/jackson-databind-2.11.0:0
# com.thoughtworks.paranamer:paranamer:2.8 -> >=app-maven/paranamer-2.8:0

CDEPEND="
	>=app-maven/paranamer-2.8:0
	>=dev-java/jackson-databind-2.11.0:0
"


DEPEND="
	>=virtual/jdk-1.7:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-databind,paranamer"
