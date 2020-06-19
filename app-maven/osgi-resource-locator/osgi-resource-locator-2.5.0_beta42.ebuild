# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/osgi-resource-locator-2.5.0-b42.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/hk2/osgi-resource-locator/2.5.0-b42/osgi-resource-locator-2.5.0-b42-sources.jar --slot 0 --keywords "~amd64" --ebuild osgi-resource-locator-2.5.0_beta42.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Used by various API providers that rely on META-INF/services mechanism to locate providers."
HOMEPAGE="https://github.com/hk2-project/hk2/osgi-resource-locator"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/hk2/${PN}/2.5.0-b42/${PN}-2.5.0-b42-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.hk2:osgi-resource-locator:2.5.0-b42"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-2.5.0-b42.pom
# org.osgi:org.osgi.compendium:4.2.0 -> >=app-maven/org-osgi-compendium-5.0.0:0
# org.osgi:org.osgi.core:4.2.0 -> >=dev-java/osgi-core-6.0.0:6

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	>=app-maven/org-osgi-compendium-5.0.0:0
	>=dev-java/osgi-core-6.0.0:6
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="org-osgi-compendium,osgi-core-6"
