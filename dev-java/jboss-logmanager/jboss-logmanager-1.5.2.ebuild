# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-logmanager-1.5.2.Final.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/logmanager/jboss-logmanager/1.5.2.Final/jboss-logmanager-1.5.2.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-logmanager-1.5.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="An implementation of java.util.logging.LogManager"
HOMEPAGE="http://www.jboss.org/jboss-logmanager"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/logmanager/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.logmanager:jboss-logmanager:1.5.2.Final"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.jboss.modules:jboss-modules:1.1.0.GA -> >=dev-java/jboss-modules-1.3.3:0

DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	>=dev-java/jboss-modules-1.3.3:0
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jboss-modules"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
