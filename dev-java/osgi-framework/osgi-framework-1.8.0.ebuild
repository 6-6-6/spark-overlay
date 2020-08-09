# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.osgi.annotation-6.0.0.pom --download-uri https://repo.maven.apache.org/maven2/org/osgi/org.osgi.annotation/6.0.0/org.osgi.annotation-6.0.0-sources.jar --slot 6 --keywords "~amd64" --ebuild osgi-annotation-6.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.osgi:org.osgi.framework:1.9.0"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="OSGi Companion Code for org.osgi.framework Version 1.9.0"
HOMEPAGE="http://www.osgi.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/osgi/org.osgi.framework/${PV}/org.osgi.framework-${PV}-sources.jar -> ${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="1"
KEYWORDS="~amd64"

CDEPEND="
	dev-java/osgi-core:6
	dev-java/osgi-annotation:6
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="osgi-core-6,osgi-annotation-6"

JAVA_SRC_DIR="src/main/java"
