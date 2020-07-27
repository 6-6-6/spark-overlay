# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/guava-29.0-jre.pom --download-uri https://repo.maven.apache.org/maven2/com/google/guava/guava/29.0-jre/guava-29.0-jre-sources.jar --slot 0 --keywords "~amd64" --ebuild guava-29.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Guava is a suite of core and expanded libraries that include utility classes, google's collections, io classes, and much much more."
HOMEPAGE="https://github.com/google/guava/guava"
SRC_URI="https://repo.maven.apache.org/maven2/com/google/${PN}/${PN}/${PV}-jre/${P}-jre-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
MAVEN_ID="com.google.guava:guava:29.0-jre"
MAVEN_PROVIDES="com.google.guava:listenablefuture:9999.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-jre.pom
# com.google.code.findbugs:jsr305:3.0.2 -> >=dev-java/jsr305-3.0.1:0
# com.google.errorprone:error_prone_annotations:2.3.4 -> >=dev-java/error-prone-annotations-2.4.0
# com.google.guava:failureaccess:1.0.1 -> !!!artifactId-not-found!!!
# com.google.guava:listenablefuture:9999.0-empty-to-avoid-conflict-with-guava -> void
# com.google.j2objc:j2objc-annotations:1.3 -> >=dev-java/error-prone-annotations-2.4.0
# org.checkerframework:checker-qual:2.11.1 -> !!!artifactId-not-found!!!

CDEPEND="
	>=app-maven/checker-qual-2.11.1:0
	>=app-maven/failureaccess-1.0.1:0
	>=dev-java/j2objc-annotations-1.3:0
	>=dev-java/error-prone-annotations-2.4.0
	>=dev-java/jsr305-3.0.1:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr305,error-prone-annotations,failureaccess,j2objc-annotations,checker-qual"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip -q ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
}
