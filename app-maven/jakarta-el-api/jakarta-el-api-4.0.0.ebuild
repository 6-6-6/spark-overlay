# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.el-api-4.0.0-RC1.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/el/jakarta.el-api/4.0.0-RC1/jakarta.el-api-4.0.0-RC1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-el-api-4.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Expression Language defines an expression language for Java applications"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.el"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/el/jakarta.el-api/${PV}-RC1/jakarta.el-api-${PV}-RC1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.el:jakarta.el-api:4.0.0-RC1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

