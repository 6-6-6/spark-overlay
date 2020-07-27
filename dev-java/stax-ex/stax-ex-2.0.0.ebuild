# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/stax-ex-2.0.0-M2.pom --download-uri https://repo1.maven.org/maven2/org/jvnet/staxex/stax-ex/2.0.0-M2/stax-ex-2.0.0-M2-sources.jar --slot 0 --keywords "~amd64" --ebuild stax-ex-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Extensions to JSR-173 StAX API."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/stax-ex"
SRC_URI="https://repo1.maven.org/maven2/org/jvnet/staxex/${PN}/${PV}-M2/${P}-M2-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/jvnet/staxex/${PN}/${PV}-M2/${P}-M2.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="1"
KEYWORDS="~amd64 ~x86 ~ppc64"
MAVEN_ID="org.jvnet.staxex:stax-ex:2.0.0-M2"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M2.pom
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> >=app-maven/jakarta-activation-api-2.0.0:0
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0-RC3 -> >=app-maven/jakarta-xml-bind-api-3.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	>=app-maven/jakarta-activation-api-2.0.0:0
	>=app-maven/jakarta-xml-bind-api-3.0.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-activation-api,jakarta-xml-bind-api"
JAVA_SRC_DIR="src/main/java"

JAVA_RM_FILES=(
	${JAVA_SRC_DIR}/module-info.java
)

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip -q ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
