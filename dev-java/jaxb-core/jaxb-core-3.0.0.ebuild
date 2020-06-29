# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaxb-core-3.0.0-M4.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/xml/bind/jaxb-core/3.0.0-M4/jaxb-core-3.0.0-M4-sources.jar --slot 0 --keywords "~amd64" --ebuild jaxb-core-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Old JAXB Core module. Contains sources required by XJC, JXC and Runtime modules with dependencies."
HOMEPAGE="https://eclipse-ee4j.github.io/jaxb-ri/jaxb-bundles/jaxb-core"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/xml/bind/${PN}/${PV}-M4/${P}-M4-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.xml.bind:jaxb-core:3.0.0-M4"
MAVEN_PROVIDE="org.glassfish.jaxb:jaxb-core:3.0.0-M4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M4.pom
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0-RC3 -> !!!groupId-not-found!!!

CDEPEND="
	>=app-maven/jakarta-xml-bind-api-3.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M4.pom
# com.sun.istack:istack-commons-runtime:4.0.0-M3 -> >=dev-java/istack-commons-runtime-4.0.0
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> !!!groupId-not-found!!!
# org.glassfish.jaxb:txw2:3.0.0-M4 -> >=dev-java/txw2-3.0.0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/istack-commons-runtime-4.0.0
	>=app-maven/jakarta-activation-api-2.0.0:0
	>=dev-java/txw2-3.0.0
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M4.pom
# com.sun.activation:jakarta.activation:2.0.0-RC3 -> !!!groupId-not-found!!!
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=app-maven/jakarta-activation-2.0.0:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-xml-bind-api,jakarta-activation"
JAVA_GENTOO_CLASSPATH_EXTRA="jakarta-activation-api,istack-commons-runtime,txw2"
