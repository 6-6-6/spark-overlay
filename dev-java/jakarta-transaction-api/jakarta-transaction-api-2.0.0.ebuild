# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.transaction-api-2.0.0-RC1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/jakarta/transaction/jakarta.transaction-api/2.0.0-RC1/jakarta.transaction-api-2.0.0-RC1-sources.jar --binjar-uri https://repo1.maven.org/maven2/jakarta/transaction/jakarta.transaction-api/2.0.0-RC1/jakarta.transaction-api-2.0.0-RC1.jar --slot 0 --keywords "~amd64" --ebuild jakarta-transaction-api-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="jakarta.transaction:jakarta.transaction-api:2.0.0-RC1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jakarta Transactions"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jta"
SRC_URI="https://repo1.maven.org/maven2/jakarta/transaction/jakarta.transaction-api/${PV}-RC1/jakarta.transaction-api-${PV}-RC1-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/jakarta/transaction/jakarta.transaction-api/${PV}-RC1/jakarta.transaction-api-${PV}-RC1.jar -> ${P}-bin.jar"
LICENSE="EPL-2.0 GPL-2-with-classpath-exception"
SLOT="2"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.transaction-api-${PV}-RC1.pom
# jakarta.enterprise:jakarta.enterprise.cdi-api:3.0.0-M1 -> >=dev-java/jakarta-enterprise-cdi-api-3.0.0.1:0
# jakarta.interceptor:jakarta.interceptor-api:2.0.0-RC1 -> >=dev-java/jakarta-interceptor-api-2.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		>=dev-java/jakarta-enterprise-cdi-api-3.0.0.1:0
		>=dev-java/jakarta-interceptor-api-2.0.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-enterprise-cdi-api,jakarta-interceptor-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
