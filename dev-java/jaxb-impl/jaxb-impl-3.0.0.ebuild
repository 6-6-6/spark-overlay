# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaxb-impl-3.0.0-M4.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/xml/bind/mvn/jaxb-impl/3.0.0-M4/jaxb-impl-3.0.0-M4-sources.jar --slot 0 --keywords "~amd64" --ebuild jaxb-impl-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Old JAXB Runtime module. Contains sources required for runtime processing."
HOMEPAGE="https://eclipse-ee4j.github.io/jaxb-ri/jaxb-bundles/jaxb-impl"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/xml/bind/${PN}/${PV}-M4/${P}-M4-sources.jar"
LICENSE=""
SLOT="3.0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.xml.bind:jaxb-impl:3.0.0-M4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M4.pom
# com.sun.xml.bind:jaxb-core:3.0.0-M4 -> dev-java/jaxb-core:${SLOT}
# com.sun.xml.fastinfoset:FastInfoset:2.0.0-M2 -> !!!groupId-not-found!!!
# org.jvnet.staxex:stax-ex:2.0.0-M2 -> !!!groupId-not-found!!!

CDEPEND="
	dev-java/jaxb-core:${SLOT}
	>=app-maven/FastInfoset-2.0.0:0
	>=app-maven/stax-ex-2.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M4.pom
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> !!!groupId-not-found!!!
# org.glassfish.jaxb:jaxb-runtime:3.0.0-M4 -> dev-java/jaxb-runtime:${SLOT}

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	dev-java/jaxb-runtime:${SLOT}
	>=app-maven/jakarta-activation-api-2.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jaxb-core-3.0,FastInfoset,stax-ex"
JAVA_GENTOO_CLASSPATH_EXTRA="jakarta-activation-api,jaxb-runtime-3.0"
