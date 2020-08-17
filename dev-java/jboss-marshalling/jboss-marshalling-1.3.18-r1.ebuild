# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom jboss-marshalling-1.3.18.GA/api/pom.xml --download-uri https://github.com/jboss-remoting/jboss-marshalling/archive/1.3.18.GA.tar.gz --slot 0 --keywords "~amd64" --ebuild jboss-marshalling-1.3.18-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.jboss.marshalling:jboss-marshalling:1.3.18.GA"
JAVA_TESTING_FRAMEWORKS="testng"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JBoss Marshalling API"
HOMEPAGE="http://www.jboss.org/jboss-marshalling-parent/jboss-marshalling"
SRC_URI="https://github.com/jboss-remoting/${PN}/archive/${PV}.GA.tar.gz -> ${P}-sources.tar.gz"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: ${P}.GA/api/pom.xml
# org.jboss.modules:jboss-modules:1.1.0.Beta1 -> >=dev-java/jboss-modules-1.3.3:0
# POM: ${P}.GA/api/pom.xml
# test? org.testng:testng:5.12.1 -> >=dev-java/testng-6.9.10:0

DEPEND="
	>=virtual/jdk-1.8:*
	>=dev-java/jboss-modules-1.3.3:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jboss-modules"
JAVA_SRC_DIR="${P}.GA/api/src/main/java"
JAVA_MAIN_CLASS="org.jboss.marshalling.Version"

JAVA_TEST_GENTOO_CLASSPATH="testng"
JAVA_TEST_SRC_DIR="${P}.GA/api/src/test/java"
