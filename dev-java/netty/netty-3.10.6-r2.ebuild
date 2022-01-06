# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.netty:${PN}:${PV}.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="NIO client-server framework for quick and easy network applications development"
HOMEPAGE="https://netty.io/"
SRC_URI="
	https://repo1.maven.org/maven2/io/${PN}/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/${PN}/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# com.google.protobuf:protobuf-java:2.5.0 -> >=dev-java/protobuf-java-3.11.4:0
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0
# io.netty:netty-tcnative:1.1.30.Fork2 -> >=dev-java/netty-tcnative-1.1.33.15:0
# javax.activation:activation:1.1.1 -> >=dev-java/javax-activation-1.1.1:0
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# log4j:log4j:1.2.16 -> >=dev-java/log4j-1.2.17:0
# org.apache.felix:org.osgi.compendium:1.4.0 -> >=dev-java/osgi-compendium-4.3.1:0
# org.apache.felix:org.osgi.core:1.4.0 -> >=dev-java/osgi-core-1.4.0:1
# org.bouncycastle:bcpkix-jdk15on:1.50 -> >=dev-java/bcpkix-1.50:1.50
# org.eclipse.jetty.npn:npn-api:1.1.0.v20120525 -> >=dev-java/jetty-npn-api-1.1.1:0
# org.jboss.logging:jboss-logging:3.1.4.GA -> >=dev-java/jboss-logging-3.4.0:0
# org.jboss.marshalling:jboss-marshalling:1.3.14.GA -> >=dev-java/jboss-marshalling-1.3.18:0
# org.slf4j:slf4j-api:1.6.4 -> >=dev-java/slf4j-api-1.7.7:0

CP_DEPEND="
	>=dev-java/javax-activation-1.1.1:0
	>=dev-java/bcpkix-1.50:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/jboss-logging-3.4.0:0
	>=dev-java/jboss-marshalling-1.3.18:0
	>=dev-java/jetty-npn-api-1.1.1:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/netty-tcnative-1.1.33.15:0
	>=dev-java/osgi-compendium-4.3.1:0
	>=dev-java/osgi-core-1.4.0:1
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.7:0
	java-virtuals/servlet-api:4.0
	dev-java/tomcat-jni:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
