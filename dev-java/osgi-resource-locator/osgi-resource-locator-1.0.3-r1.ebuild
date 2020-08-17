# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/osgi-resource-locator-1.0.3.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/hk2/osgi-resource-locator/1.0.3/osgi-resource-locator-1.0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild osgi-resource-locator-1.0.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.glassfish.hk2:osgi-resource-locator:1.0.3"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Used by various API providers that rely on META-INF/services mechanism to locate providers."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/osgi-resource-locator"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/hk2/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/hk2/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="GPL-2-with-classpath-exception EPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:osgi.cmpn:6.0.0 -> >=dev-java/osgi-cmpn-6.0.0:6
# org.osgi:osgi.core:6.0.0 -> >=dev-java/osgi-core-6.0.0:6

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		>=dev-java/osgi-cmpn-6.0.0:6
		>=dev-java/osgi-core-6.0.0:6
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="osgi-cmpn-6,osgi-core-6"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
