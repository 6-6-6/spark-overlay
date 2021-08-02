# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/h2o-tree-api-0.3.18.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/ai/h2o/h2o-tree-api/0.3.18/h2o-tree-api-0.3.18-sources.jar --binjar-uri https://repo1.maven.org/maven2/ai/h2o/h2o-tree-api/0.3.18/h2o-tree-api-0.3.18.jar --slot 0 --keywords "~amd64" --ebuild h2o-tree-api-0.3.18.ebuild

EAPI=7

MAVEN_ID="ai.h2o:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Pure Java implementation of XGBoost predictor for online prediction tasks"
HOMEPAGE="https://www.h2o.ai/"
SRC_URI="
	https://repo1.maven.org/maven2/ai/h2o/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/ai/h2o/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
