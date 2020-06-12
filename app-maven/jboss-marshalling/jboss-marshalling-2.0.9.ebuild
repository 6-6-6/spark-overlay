# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-marshalling-2.0.9.Final.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/marshalling/jboss-marshalling/2.0.9.Final/jboss-marshalling-2.0.9.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-marshalling-2.0.9.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JBoss Marshalling API"
HOMEPAGE="http://www.jboss.org/jboss-marshalling-parent/jboss-marshalling"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/marshalling/${PN}/${PV}.Final/${P}.Final-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.marshalling:jboss-marshalling:2.0.9.Final"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.jboss.modules:jboss-modules:1.6.0.Final -> >=dev-java/jboss-modules-1.3.3:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=dev-java/jboss-modules-1.3.3:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH_EXTRA="jboss-modules"
