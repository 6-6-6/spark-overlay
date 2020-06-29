# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/compiler-0.8.17.pom --download-uri https://repo.maven.apache.org/maven2/com/github/spullara/mustache/java/compiler/0.8.17/compiler-0.8.17-sources.jar --slot 0 --keywords "~amd64" --ebuild mustache-java-compiler-0.8.17.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Implementation of mustache.js for Java"
HOMEPAGE="http://github.com/spullara/mustache.java"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/spullara/mustache/java/compiler/${PV}/compiler-${PV}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.github.spullara.mustache.java:compiler:0.8.17"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/compiler-${PV}.pom
# com.google.guava:guava:16.0.1 -> >=dev-java/guava-20.0:0

CDEPEND="
	>=dev-java/guava-20.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/compiler-${PV}.pom
# org.jruby:jruby:1.6.7 -> >=app-maven/jruby-1.6.7:0

DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jruby-1.6.7:0
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava-${PV%.*}"
JAVA_CLASSPATH_EXTRA="jruby"
