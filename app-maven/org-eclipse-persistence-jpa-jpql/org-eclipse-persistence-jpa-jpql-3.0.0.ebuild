# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.eclipse.persistence.jpa.jpql-3.0.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/persistence/org.eclipse.persistence.jpa.jpql/3.0.0-M1/org.eclipse.persistence.jpa.jpql-3.0.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild org-eclipse-persistence-jpa-jpql-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="TBD"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/org.eclipse.persistence.parent/jpa/org.eclipse.persistence.jpa.jpql"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/persistence/org.eclipse.persistence.jpa.jpql/${PV}-M1/org.eclipse.persistence.jpa.jpql-${PV}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.persistence:org.eclipse.persistence.jpa.jpql:3.0.0-M1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

