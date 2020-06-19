# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-util-9.4.28.v20200408.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/jetty/jetty-util/9.4.28.v20200408/jetty-util-9.4.28.v20200408-sources.jar --slot 0 --keywords "~amd64" --ebuild jetty-util-9.4.28_p20200408.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Utility classes for Jetty"
HOMEPAGE="http://www.eclipse.org/jetty"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/jetty/${PN}/9.4.28.v20200408/${PN}-9.4.28.v20200408-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.jetty:jetty-util:9.4.28.v20200408"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-9.4.28.v20200408.pom
# javax.servlet:javax.servlet-api:3.1.0 -> >=java-virtuals/servlet-api-3.1:3.1
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=dev-java/slf4j-api-2.0.0_alpha1:0
	>=java-virtuals/servlet-api-3.1:3.1
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="servlet-api-3.1,slf4j-api"
