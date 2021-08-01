# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/groovy-all-2.4.0.pom --download-uri https://repo1.maven.org/maven2/org/codehaus/groovy/groovy-all/2.4.0/groovy-all-2.4.0-sources.jar --slot 0 --keywords "~amd64" --ebuild groovy-all-2.4.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.groovy:groovy-all:2.4.0"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Groovy: A powerful, dynamic language for the JVM"
HOMEPAGE="https://groovy-lang.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/codehaus/groovy/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/groovy/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Lots of compiler errors related to type checking
IUSE="+binary"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# bsf:bsf:2.4.0 -> >=dev-java/bsf-2.4.0:2.3
# com.beust:jcommander:1.47 -> >=dev-java/jcommander-1.48:0
# com.thoughtworks.qdox:qdox:1.12.1 -> >=dev-java/qdox-1.12.1:1.12
# com.thoughtworks.xstream:xstream:1.4.7 -> >=dev-java/xstream-1.4.7:0
# commons-logging:commons-logging:1.2 -> >=dev-java/commons-logging-1.2:0
# jline:jline:2.12 -> >=dev-java/jline-2.12.1:2
# junit:junit:4.12 -> >=dev-java/junit-4.12:4
# org.apache.ant:ant:1.9.4 -> >=dev-java/ant-core-1.10.7:0
# org.apache.ivy:ivy:2.4.0 -> >=dev-java/ant-ivy-2.4.0:2
# org.fusesource.jansi:jansi:1.11 -> >=dev-java/jansi-1.11-r2:0

CDEPEND="
	>=dev-java/xstream-1.4.7:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/ant-ivy-2.4.0:2
	>=dev-java/bsf-2.4.0:2.3
	>=dev-java/commons-logging-1.2:0
	>=dev-java/jansi-1.11-r2:0
	>=dev-java/jcommander-1.48:0
	>=dev-java/jline-2.12.1:2
	>=dev-java/junit-4.12:4
	>=dev-java/qdox-1.12.1:1.12
	dev-java/commons-cli:1
"

BDEPEND="
	app-arch/unzip
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:jsp-api:2.0 -> java-virtuals/jsp-api:2.3
# javax.servlet:servlet-api:2.4 -> java-virtuals/servlet-api:4.0

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CDEPEND}
		java-virtuals/jsp-api:2.3
		java-virtuals/servlet-api:4.0
	)
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.ant:ant-antlr:1.9.4 -> >=dev-java/ant-antlr-1.10.7:0
# org.apache.ant:ant-junit:1.9.4 -> >=dev-java/ant-junit-1.10.7:0
# org.apache.ant:ant-launcher:1.9.4 -> >=dev-java/ant-launcher-1.9.4:0
# org.codehaus.gpars:gpars:1.2.1 -> >=dev-java/gpars-1.2.1:0
# org.testng:testng:6.8.13 -> >=dev-java/testng-6.9.10:0
RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
	>=dev-java/ant-launcher-1.9.4:0
	>=dev-java/gpars-1.2.1:0
	>=dev-java/ant-antlr-1.10.7:0
	>=dev-java/ant-junit-1.10.7:0
	>=dev-java/testng-6.9.10:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="bsf-2.3,jcommander,qdox-1.12,xstream,commons-logging,jline-2,junit-4,ant-core,ant-ivy-2,jansi,ant-antlr,ant-junit,ant-launcher,gpars,testng,commons-cli-1"
JAVA_CLASSPATH_EXTRA="jsp-api-2.3,servlet-api-4.0"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
