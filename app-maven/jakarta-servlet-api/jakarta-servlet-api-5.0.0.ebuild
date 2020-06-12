# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.servlet-api-5.0.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/servlet/jakarta.servlet-api/5.0.0-M1/jakarta.servlet-api-5.0.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-servlet-api-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Eclipse Enterprise for Java (EE4J) is an open source initiative to create standard APIs,
        implementations of those APIs, and technology compatibility kits for Java runtimes
        that enable development, deployment, and management of server-side and cloud-native applications."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.servlet"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/servlet/jakarta.servlet-api/${PV}-M1/jakarta.servlet-api-${PV}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.servlet:jakarta.servlet-api:5.0.0-M1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

