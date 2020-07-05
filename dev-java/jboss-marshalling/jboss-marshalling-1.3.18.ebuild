# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-marshalling-1.3.18.GA.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/marshalling/jboss-marshalling/1.3.18.GA/jboss-marshalling-1.3.18.GA-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-marshalling-1.3.18.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JBoss Marshalling API"
HOMEPAGE="http://www.jboss.org/jboss-marshalling-parent/jboss-marshalling"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/marshalling/${PN}/${PV}.GA/${P}.GA-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.marshalling:jboss-marshalling:1.3.18.GA"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.GA.pom
# org.jboss.modules:jboss-modules:1.1.0.Beta1 -> >=dev-java/jboss-modules-1.3.3:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	>=dev-java/jboss-modules-1.3.3:0
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jboss-modules"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
