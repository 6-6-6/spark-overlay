# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jruby-core-9.2.11.1.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/jruby-core/9.2.11.1/jruby-core-9.2.11.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jruby-core-9.2.11.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JRuby is the effort to recreate the Ruby (https://www.ruby-lang.org) interpreter in Java."
HOMEPAGE="https://github.com/jruby/jruby/jruby-core"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby:jruby-core:9.2.11.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jffi:1.2.23 -> >=dev-java/jffi-1.2.9:1.2
# com.github.jnr:jffi:1.2.23 -> >=dev-java/jffi-1.2.9:1.2
# com.github.jnr:jnr-constants:0.9.15 -> >=dev-java/jnr-constants-0.8.6:0
# com.github.jnr:jnr-enxio:0.25 -> >=dev-java/jnr-enxio-0.7:0
# com.github.jnr:jnr-netdb:1.1.6 -> >=dev-java/jnr-netdb-1.1.4:1.0
# com.github.jnr:jnr-posix:3.0.54 -> >=dev-java/jnr-posix-3.0.10:3.0
# com.github.jnr:jnr-unixsocket:0.28 -> >=dev-java/jnr-unixsocket-0.6:0
# com.headius:backport9:1.3 -> >=app-maven/backport9-1.7:0
# com.headius:invokebinder:1.11 -> >=dev-java/invokebinder-1.6:0
# com.headius:options:1.4 -> >=dev-java/headius-options-1.1:0
# com.jcraft:jzlib:1.1.3 -> >=dev-java/jzlib-1.1.1:1.1
# com.martiansoftware:nailgun-server:0.9.1 -> >=app-maven/nailgun-server-0.9.1:0
# javax.annotation:javax.annotation-api:1.3.1 -> >=dev-java/jsr250-1.2:0
# joda-time:joda-time:2.10.5 -> >=dev-java/joda-time-2.7:0
# org.jruby:dirgra:0.3 -> >=app-maven/dirgra-0.3:0
# org.jruby.jcodings:jcodings:1.0.46 -> >=dev-java/jcodings-1.0.11:1
# org.jruby.joni:joni:2.1.31 -> >=dev-java/joni-2.1.0:2.1

CDEPEND="
	>=app-maven/backport9-1.7:0
	>=app-maven/dirgra-0.3:0
	>=app-maven/nailgun-server-0.9.1:0
	>=dev-java/headius-options-1.1:0
	>=dev-java/invokebinder-1.6:0
	>=dev-java/jcodings-1.0.11:1
	>=dev-java/jffi-1.2.9:1.2
	>=dev-java/jnr-constants-0.8.6:0
	>=dev-java/jnr-enxio-0.7:0
	>=dev-java/jnr-netdb-1.1.4:1.0
	>=dev-java/jnr-posix-3.0.10:3.0
	>=dev-java/jnr-unixsocket-0.6:0
	>=dev-java/joda-time-2.7:0
	>=dev-java/joni-2.1.0:2.1
	>=dev-java/jsr250-1.2:0
	>=dev-java/jzlib-1.1.1:1.1
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# bsf:bsf:2.4.0 -> >=dev-java/bsf-2.4.0:2.3
# org.apache.ant:ant:1.9.8 -> >=dev-java/ant-core-1.10.7:0
# org.jruby:joda-timezones:2019 -> >=app-maven/joda-timezones-bin-2019:0
# org.osgi:org.osgi.core:5.0.0 -> >=app-maven/osgi-core-6.0.0:6
# org.slf4j:slf4j-api:1.7.12 -> >=dev-java/slf4j-api-1.7.7:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/joda-timezones-bin-2019:0
	>=app-maven/osgi-core-6.0.0:6
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/bsf-2.4.0:2.3
	>=dev-java/slf4j-api-1.7.7:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="utf-8"

JAVA_GENTOO_CLASSPATH="jffi-1.2,jffi-1.2,jnr-constants,jnr-enxio,jnr-netdb-1.0,jnr-posix-3.0,jnr-unixsocket,backport9,invokebinder,headius-options,jzlib-1.1,nailgun-server,jsr250,joda-time,dirgra,jcodings-1,joni-2.1"
JAVA_GENTOO_CLASSPATH_EXTRA="bsf-2.3,ant-core,joda-timezones-bin,osgi-core-6,slf4j-api"
