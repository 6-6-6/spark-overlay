# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/commonj-1.1.1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/codehaus/fabric3/api/commonj/1.1.1/commonj-1.1.1-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/codehaus/fabric3/api/commonj/1.1.1/commonj-1.1.1.jar --slot 0 --keywords "~amd64" --ebuild commonj-1.1.1.ebuild

EAPI=7

MAVEN_ID="org.codehaus.fabric3.api:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="CommonJ API"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="
	https://repo1.maven.org/maven2/org/codehaus/fabric3/api/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/fabric3/api/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
# The license indicated by
# https://mvnrepository.com/artifact/org.codehaus.fabric3.api/commonj/1.1.1
# points to a page that already has been deleted, but it is archived at
# https://web.archive.org/web/20090814044933/www.fabric3.org/f3license.html,
# which claims that this package "is licensed under the GNU Public License v3
# with the GNU Classpath Exception clause".  In ::gentoo, there is only
# "GPL-2-with-classpath-exception", but the license page also states that
# "modifications to Fabric3 such as enhancements or extensions must be
# distributed under the GPL v3 (the Classpath Exception is optional)".
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"

JAVA_ENCODING="ISO-8859-15"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" $(find * -name "*.txt") || \
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
