# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/reactor-core-3.1.4.RELEASE.pom --download-uri https://repo1.maven.org/maven2/io/projectreactor/reactor-core/3.1.4.RELEASE/reactor-core-3.1.4.RELEASE-sources.jar --slot 0 --keywords "~amd64" --ebuild reactor-core-3.1.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.projectreactor:reactor-core:3.1.4.RELEASE"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Non-Blocking Reactive Foundation for the JVM"
HOMEPAGE="https://github.com/reactor/reactor-core"
SRC_URI="https://repo1.maven.org/maven2/io/projectreactor/${PN}/${PV}.RELEASE/${P}.RELEASE-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/projectreactor/${PN}/${PV}.RELEASE/${P}.RELEASE.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.RELEASE.pom
# com.google.code.findbugs:jsr305:3.0.2 -> >=dev-java/jsr305-3.0.2:0
# org.jetbrains.kotlin:kotlin-stdlib:1.1.61 -> >=dev-java/kotlin-common-bin-1.3.72:0
# org.reactivestreams:reactive-streams:1.0.2 -> >=dev-java/reactive-streams-1.0.2:0
# org.slf4j:slf4j-api:1.7.12 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/reactive-streams-1.0.2:0
	>=dev-java/jsr305-3.0.2:0
	>=dev-java/kotlin-common-bin-1.3.72:0
	>=dev-java/slf4j-api-1.7.28:0
	dev-java/java9-concurrent-backport:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr305,kotlin-common-bin,reactive-streams,slf4j-api,java9-concurrent-backport"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	java-pkg-2_src_prepare

	sed -i "s/java.util.concurrent/java9.util.concurrent/"\
		"${S}"/${JAVA_SRC_DIR}/reactor/adapter/JdkFlowAdapter.java || die
}
