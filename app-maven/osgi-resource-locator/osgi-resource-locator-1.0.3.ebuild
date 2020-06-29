# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/osgi-resource-locator-1.0.3.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/hk2/osgi-resource-locator/1.0.3/osgi-resource-locator-1.0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild osgi-resource-locator-1.0.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Used by various API providers that rely on META-INF/services mechanism to locate providers."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/osgi-resource-locator"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/hk2/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.hk2:osgi-resource-locator:1.0.3"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:osgi.cmpn:6.0.0 -> >=app-maven/osgi-cmpn-6.0.0:0
# org.osgi:osgi.core:6.0.0 -> >=dev-java/osgi-core-7.0.0:7

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/osgi-cmpn-6.0.0:0
	>=dev-java/osgi-core-7.0.0:7
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="osgi-cmpn,osgi-core-7"
