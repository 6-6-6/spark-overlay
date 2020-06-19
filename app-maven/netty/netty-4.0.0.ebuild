# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-4.0.0.Alpha8.pom --download-uri https://repo.maven.apache.org/maven2/io/netty/netty/4.0.0.Alpha8/netty-4.0.0.Alpha8-sources.jar --slot 0 --keywords "~amd64" --ebuild netty-4.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Netty is an asynchronous event-driven network application framework for 
    rapid development of maintainable high performance protocol servers and
    clients."
HOMEPAGE="http://netty.io/netty/"
SRC_URI="https://repo.maven.apache.org/maven2/io/${PN}/${PN}/${PV}.Alpha8/${P}.Alpha8-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.netty:netty:4.0.0.Alpha8"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha8.pom
# com.google.protobuf:protobuf-java:2.4.1 -> >=dev-java/protobuf-java-3.11.4:0
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0
# io.netty:netty-example:4.0.0.Alpha8 -> >=app-maven/netty-example-5.0.0:0
# io.netty:netty-metrics-yammer:4.0.0.Alpha8 -> >=app-maven/netty-metrics-yammer-4.0.0:0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.jboss.logging:jboss-logging-spi:2.1.2.GA -> >=app-maven/jboss-logging-spi-2.2.0:0
# org.jboss.marshalling:jboss-marshalling:1.3.14.GA -> >=app-maven/jboss-marshalling-2.0.9:0
# org.osgi:org.osgi.compendium:4.3.0 -> >=app-maven/org-osgi-compendium-5.0.0:0
# org.osgi:org.osgi.core:4.3.0 -> >=dev-java/osgi-core-6.0.0:6
# org.slf4j:slf4j-api:1.6.5 -> >=dev-java/slf4j-ext-1.7.5:0

CDEPEND="
	>=app-maven/jboss-logging-spi-2.2.0:0
	>=app-maven/jboss-marshalling-2.0.9:0
	>=app-maven/netty-example-5.0.0:0
	>=app-maven/netty-metrics-yammer-4.0.0:0
	>=app-maven/org-osgi-compendium-5.0.0:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/osgi-core-6.0.0:6
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-ext-1.7.5:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="protobuf-java,commons-logging,netty-example,netty-metrics-yammer,log4j,jboss-logging-spi,jboss-marshalling,org-osgi-compendium,osgi-core-6,slf4j-ext"
