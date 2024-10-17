# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom jakarta.transaction-api-2.0.1.pom --download-uri https://repo1.maven.org/maven2/jakarta/transaction/jakarta.transaction-api/2.0.1/jakarta.transaction-api-2.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-transaction-api-2.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="jakarta.transaction:jakarta.transaction-api:2.0.1"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Transactions"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jta"
SRC_URI="https://repo1.maven.org/maven2/jakarta/transaction/jakarta.transaction-api/${PV}/jakarta.transaction-api-${PV}-sources.jar -> ${P}-sources.jar"
LICENSE="EPL-2.0 GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	dev-java/jakarta-interceptors:0
	dev-java/cdi-api:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="cdi-api,jakarta-interceptors"
JAVA_SRC_DIR="jakarta"
