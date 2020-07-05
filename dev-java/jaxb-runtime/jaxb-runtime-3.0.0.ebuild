# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaxb-runtime-3.0.0-M4.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/jaxb/jaxb-runtime/3.0.0-M4/jaxb-runtime-3.0.0-M4-sources.jar --slot 0 --keywords "~amd64" --ebuild jaxb-runtime-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JAXB (JSR 222) Reference Implementation"
HOMEPAGE="https://eclipse-ee4j.github.io/jaxb-ri/jaxb-runtime-parent/jaxb-runtime"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/jaxb/${PN}/${PV}-M4/${P}-M4-sources.jar"
LICENSE=""
SLOT="3.0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jaxb:jaxb-runtime:3.0.0-M4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M4.pom
# com.sun.xml.fastinfoset:FastInfoset:2.0.0-M2 -> !!!groupId-not-found!!!
# org.glassfish.jaxb:jaxb-core:3.0.0-M4 -> dev-java/jaxb-core:${SLOT}
# org.jvnet.staxex:stax-ex:2.0.0-M2 -> !!!groupId-not-found!!!

CDEPEND="
	dev-java/jaxb-core:${SLOT}
	>=app-maven/FastInfoset-2.0.0:0
	>=app-maven/stax-ex-2.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M4.pom
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> !!!groupId-not-found!!!

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jakarta-activation-api-2.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="FastInfoset,jaxb-core,stax-ex"
JAVA_GENTOO_CLASSPATH_EXTRA="jakarta-activation-api"
