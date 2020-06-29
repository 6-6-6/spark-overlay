# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/osgi.cmpn-6.0.0.pom --download-uri https://repo.maven.apache.org/maven2/org/osgi/osgi.cmpn/6.0.0/osgi.cmpn-6.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild osgi-cmpn-6.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Compendium Release 6, Interfaces and Classes for use in compiling bundles."
HOMEPAGE="http://www.osgi.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/osgi/osgi.cmpn/${PV}/osgi.cmpn-${PV}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.osgi:osgi.cmpn:6.0.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

