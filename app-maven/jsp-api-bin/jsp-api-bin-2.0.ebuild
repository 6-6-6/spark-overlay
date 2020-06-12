# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jsp-api-2.0.pom --download-uri https://repo.maven.apache.org/maven2/javax/servlet/jsp-api/2.0/jsp-api-2.0.jar --slot 0 --keywords "~amd64" --ebuild jsp-api-bin-2.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/javax/servlet/jsp-api/${PV}/jsp-api-${PV}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.servlet:jsp-api:2.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jsp-api-${PV}.pom
# javax.servlet:servlet-api:2.4 -> >=java-virtuals/servlet-api-2.3:2.3

CDEPEND="
	>=java-virtuals/servlet-api-2.3:2.3
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="servlet-api-2.3"
