# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jcsp-1.1-rc5.pom --download-uri https://repo1.maven.org/maven2/org/codehaus/jcsp/jcsp/1.1-rc5/jcsp-1.1-rc5.jar --slot 0 --keywords "~amd64" --ebuild jcsp-1.1_rc5.ebuild

EAPI=8

MAVEN_ID="org.codehaus.jcsp:jcsp:1.1-rc5"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Communicating Sequential Processes (CSP) for use in Java"
HOMEPAGE="https://www.cs.kent.ac.uk/projects/ofa/jcsp"
SRC_URI="https://repo1.maven.org/maven2/org/codehaus/${PN}/${PN}/1.1-rc5/${PN}-1.1-rc5.jar -> ${P}.jar"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-1.1-rc5.pom
# org.apache.felix:org.osgi.core:1.4.0 -> >=dev-java/osgi-core-1.4.0:1

CDEPEND="
	>=dev-java/osgi-core-1.4.0:1
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="osgi-core-1"
