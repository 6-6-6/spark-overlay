# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.eclipse.persistence.asm-3.0.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/persistence/org.eclipse.persistence.asm/3.0.0-M1/org.eclipse.persistence.asm-3.0.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild org-eclipse-persistence-asm-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="TBD"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/org.eclipse.persistence.parent/plugins/org.eclipse.persistence.asm"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/persistence/org.eclipse.persistence.asm/${PV}-M1/org.eclipse.persistence.asm-${PV}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.persistence:org.eclipse.persistence.asm:3.0.0-M1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/org.eclipse.persistence.asm-${PV}-M1.pom
# org.ow2.asm:asm:7.3.1 -> >=dev-java/asm-8.0.1:0
# org.ow2.asm:asm-commons:7.3.1 -> >=app-maven/asm-commons-8.0.1:0
# org.ow2.asm:asm-tree:7.3.1 -> >=app-maven/asm-tree-8.0.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/asm-commons-8.0.1:0
	>=app-maven/asm-tree-8.0.1:0
	>=dev-java/asm-8.0.1:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="asm,asm-commons,asm-tree"
