# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.osgi.compendium-1.4.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/felix/org.osgi.compendium/1.4.0/org.osgi.compendium-1.4.0-sources.jar --slot 0 --keywords "~amd64" --ebuild org-osgi-compendium-1.4.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Service Platform Release 4 Compendium Interfaces and Classes."
HOMEPAGE="http://felix.apache.org/org.osgi.compendium/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/felix/org.osgi.compendium/${PV}/org.osgi.compendium-${PV}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.felix:org.osgi.compendium:1.4.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/org.osgi.compendium-${PV}.pom
# org.apache.felix:javax.servlet:1.0.0 -> >=app-maven/javax-servlet-bin-1.0.0:0
# org.apache.felix:org.osgi.core:1.4.0 -> >=app-maven/osgi-core-1.4.0:1
# org.apache.felix:org.osgi.foundation:1.2.0 -> >=dev-java/osgi-foundation-1.2.0:0

CDEPEND="
	>=app-maven/javax-servlet-bin-1.0.0:0
	>=app-maven/osgi-core-1.4.0:1
	>=dev-java/osgi-foundation-1.2.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.3:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="javax-servlet-bin,osgi-core-1,osgi-foundation"
JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
