# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.mail-2.0.0-RC6.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/mail/jakarta.mail/2.0.0-RC6/jakarta.mail-2.0.0-RC6-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-mail-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Mail API"
HOMEPAGE="http://eclipse-ee4j.github.io/mail/jakarta.mail"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/mail/jakarta.mail/${PV}-RC6/jakarta.mail-${PV}-RC6-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.mail:jakarta.mail:2.0.0-RC6"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.mail-${PV}-RC6.pom
# com.sun.activation:jakarta.activation:2.0.0-RC3 -> >=app-maven/jakarta-activation-2.0.0:0

CDEPEND="
	>=app-maven/jakarta-activation-2.0.0:0
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

JAVA_ENCODING="iso-8859-1"

JAVA_GENTOO_CLASSPATH="jakarta-activation"
