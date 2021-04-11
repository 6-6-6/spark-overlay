# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.eclipse.persistence.jpa.jpql-3.0.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.jpa.jpql/3.0.0/org.eclipse.persistence.jpa.jpql-3.0.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.jpa.jpql/3.0.0/org.eclipse.persistence.jpa.jpql-3.0.0.jar --slot 0 --keywords "~amd64" --ebuild org-eclipse-persistence-jpa-jpql-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.eclipse.persistence:org.eclipse.persistence.jpa.jpql:3.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Comprehensive and universal persistence framework for Java."
HOMEPAGE="http://www.eclipse.org/eclipselink/jpa/org.eclipse.persistence.jpa.jpql"
SRC_URI="https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.jpa.jpql/${PV}/org.eclipse.persistence.jpa.jpql-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.jpa.jpql/${PV}/org.eclipse.persistence.jpa.jpql-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 EPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
