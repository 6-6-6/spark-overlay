# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-logging-processor-2.1.0.Final.pom --download-uri https://repo1.maven.org/maven2/org/jboss/logging/jboss-logging-processor/2.1.0.Final/jboss-logging-processor-2.1.0.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-logging-processor-2.1.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.logging:jboss-logging-processor:2.1.0.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Parent POM for JBoss projects. Provides default project build configuration."
HOMEPAGE="http://www.jboss.org/jboss-logging-tools-parent/jboss-logging-processor"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/logging/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/logging/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.jboss.jdeparser:jdeparser:2.0.2.Final -> >=dev-java/jdeparser-2.0.2:0
# org.jboss.logging:jboss-logging-annotations:2.1.0.Final -> >=dev-java/jboss-logging-annotations-2.1.0:0

CDEPEND="
	>=dev-java/jboss-logging-annotations-2.1.0:0
	>=dev-java/jdeparser-2.0.2:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.jboss.logging:jboss-logging:3.1.2.GA -> >=dev-java/jboss-logging-3.1.4:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/jboss-logging-3.1.4:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jdeparser,jboss-logging-annotations"
JAVA_CLASSPATH_EXTRA="jboss-logging"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
