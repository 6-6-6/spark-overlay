# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.eclipse.persistence.asm-3.0.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.asm/3.0.0/org.eclipse.persistence.asm-3.0.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.asm/3.0.0/org.eclipse.persistence.asm-3.0.0.jar --slot 0 --keywords "~amd64" --ebuild org-eclipse-persistence-asm-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.eclipse.persistence:org.eclipse.persistence.asm:3.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Comprehensive and universal persistence framework for Java."
HOMEPAGE="http://www.eclipse.org/eclipselink/plugins/org.eclipse.persistence.asm"
SRC_URI="https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.asm/${PV}/org.eclipse.persistence.asm-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.asm/${PV}/org.eclipse.persistence.asm-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 EPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/org.eclipse.persistence.asm-${PV}.pom
# org.ow2.asm:asm:9.0 -> >=dev-java/asm-9.0:0
# org.ow2.asm:asm-commons:9.0 -> >=dev-java/asm-commons-9.0:0
# org.ow2.asm:asm-tree:9.0 -> >=dev-java/asm-tree-9.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		>=dev-java/asm-9.0:0
		>=dev-java/asm-commons-9.0:0
		>=dev-java/asm-tree-9.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="asm,asm-commons,asm-tree"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
