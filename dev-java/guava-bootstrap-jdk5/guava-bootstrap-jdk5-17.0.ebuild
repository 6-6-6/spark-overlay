# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/guava-bootstrap-jdk5-17.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/guava/guava-bootstrap-jdk5/17.0/guava-bootstrap-jdk5-17.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/guava/guava-bootstrap-jdk5/17.0/guava-bootstrap-jdk5-17.0.jar --slot 0 --keywords "~amd64" --ebuild guava-bootstrap-jdk5-17.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.guava:guava-bootstrap-jdk5:17.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="ExecutorService's type parameters changed between JDK5 and JDK6 in a way that makes it impossible for our invokeAll/invokeAny methods to match both at compile time. This project builds a JDK6-like copy of ExecutorService (but with JDK5 compiler settings to ensure that it will work with JRE5 at runtime). It also builds a version of AbstractExecutorService that is equivalent to a JDK5 version but using the JDK6 type parameters for the invokeAll/invokeAny methods just as with ExecutorService. This project's is then used in the bootstrap class path of Guava proper."
HOMEPAGE="http://code.google.com/p/guava-libraries/guava-bootstrap-jdk5"
SRC_URI="https://repo1.maven.org/maven2/com/google/guava/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/guava/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
