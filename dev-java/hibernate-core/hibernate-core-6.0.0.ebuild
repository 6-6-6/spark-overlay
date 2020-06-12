# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hibernate-entitymanager-6.0.0.Alpha3.pom --download-uri https://repo.maven.apache.org/maven2/org/hibernate/hibernate-entitymanager/6.0.0.Alpha3/hibernate-entitymanager-6.0.0.Alpha3-sources.jar --slot 0 --keywords "~amd64" --ebuild hibernate-entitymanager-6.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="(deprecated - use hibernate-core instead) Hibernate O/RM implementation of the JPA specification"
HOMEPAGE="http://hibernate.org/orm"
SRC_URI="https://repo.maven.apache.org/maven2/org/hibernate/orm/${PN}/${PV}.Alpha5/${P}.Alpha5-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.hibernate.orm:hibernate-core:6.0.0.Alpha5"
MAVEN_PROVIDE="org.hibernate:hibernate-entitymanager:6.0.0.Alpha5 org.hibernate:hibernate-core:6.0.0.Alpha5"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

