# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jruby-core-1.7.22.pom --download-uri https://repo1.maven.org/maven2/org/jruby/jruby-core/1.7.22/jruby-core-1.7.22-sources.jar --slot 0 --keywords "~amd64" --ebuild jruby-core-1.7.22-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jruby:jruby-core:1.7.22"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="JRuby is the effort to recreate the Ruby (http://www.ruby-lang.org) interpreter in Java."
HOMEPAGE="https://github.com/jruby/jruby/jruby-core"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="LGPL-3 GPL-3 EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jffi:1.2.9 -> >=dev-java/jffi-1.2.9:1.2
# com.github.jnr:jffi:1.2.9 -> >=dev-java/jffi-1.2.9:1.2
# com.github.jnr:jnr-constants:0.8.7 -> >=dev-java/jnr-constants-0.8.7:0
# com.github.jnr:jnr-enxio:0.9 -> >=dev-java/jnr-enxio-0.9:0
# com.github.jnr:jnr-ffi:2.0.3 -> >=dev-java/jnr-ffi-2.0.3:0
# com.github.jnr:jnr-netdb:1.1.2 -> >=dev-java/jnr-netdb-1.1.4:1.0
# com.github.jnr:jnr-posix:3.0.12 -> >=dev-java/jnr-posix-3.0.12:0
# com.github.jnr:jnr-unixsocket:0.8 -> >=dev-java/jnr-unixsocket-0.8:0
# com.github.jnr:jnr-x86asm:1.0.2 -> >=dev-java/jnr-x86asm-1.0.2:1.0
# com.headius:invokebinder:1.2 -> >=dev-java/invokebinder-1.6:0
# com.headius:options:1.2 -> >=dev-java/headius-options-1.4:0
# com.jcraft:jzlib:1.1.3 -> >=dev-java/jzlib-1.1.3:1.1.3
# com.martiansoftware:nailgun-server:0.9.1 -> >=dev-java/nailgun-server-0.9.1:0
# joda-time:joda-time:2.5 -> >=dev-java/joda-time-2.7:0
# org.jruby:yecht:1.0 -> >=dev-java/yecht-1.0:0
# org.jruby.extras:bytelist:1.0.11 -> >=dev-java/bytelist-1.0.15:0
# org.jruby.jcodings:jcodings:1.0.13 -> >=dev-java/jcodings-1.0.13:0
# org.jruby.joni:joni:2.1.3 -> >=dev-java/joni-2.1.3:2.1
# org.ow2.asm:asm:5.0.3 -> >=dev-java/asm-8.0.1:4
# org.ow2.asm:asm-analysis:5.0.3 -> >=dev-java/asm-8.0.1:4
# org.ow2.asm:asm-commons:5.0.3 -> >=dev-java/asm-8.0.1:4
# org.ow2.asm:asm-util:5.0.3 -> >=dev-java/asm-8.0.1:4
# org.yaml:snakeyaml:1.13 -> >=dev-java/snakeyaml-1.16:0

CDEPEND="
	>=dev-java/nailgun-server-0.9.1:0
	>=dev-java/yecht-1.0:0
	>=dev-java/asm-5.0.3:4
	>=dev-java/bytelist-1.0.15:0
	>=dev-java/headius-options-1.4:0
	>=dev-java/invokebinder-1.6:0
	>=dev-java/jcodings-1.0.13:0
	>=dev-java/jffi-1.2.9:1.2
	>=dev-java/jnr-constants-0.8.7:0
	>=dev-java/jnr-enxio-0.9:0
	>=dev-java/jnr-ffi-2.0.3:0
	>=dev-java/jnr-netdb-1.1.4:1.0
	>=dev-java/jnr-posix-3.0.12:0
	>=dev-java/jnr-unixsocket-0.8:0
	>=dev-java/jnr-x86asm-1.0.2:1.0
	>=dev-java/joda-time-2.7:0
	>=dev-java/joni-2.1.3:2.1
	>=dev-java/jzlib-1.1.3:1.1.3
	>=dev-java/snakeyaml-1.16:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# bsf:bsf:2.4.0 -> >=dev-java/bsf-2.4.0:2.3
# com.headius:coro-mock:1.0 -> >=dev-java/coro-mock-1.0:0
# com.headius:jsr292-mock:1.1 -> >=dev-java/jsr292-mock-1.1:0
# com.headius:unsafe-mock:8.0 -> >=dev-java/unsafe-mock-8.0:0
# org.apache.ant:ant:1.9.2 -> >=dev-java/ant-core-1.10.7:0
# org.jruby:joda-timezones:2013d -> >=dev-java/joda-timezones-2013:0
# org.osgi:org.osgi.core:5.0.0 -> >=dev-java/osgi-core-api-5.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/coro-mock-1.0:0
	>=dev-java/joda-timezones-2013:0
	>=dev-java/jsr292-mock-1.1:0
	>=dev-java/unsafe-mock-8.0:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/bsf-2.4.0:2.3
	>=dev-java/osgi-core-api-5.0.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="utf-8"

JAVA_GENTOO_CLASSPATH="jffi-1.2,jffi-1.2,jnr-constants,jnr-enxio,jnr-ffi,jnr-netdb-1.0,jnr-posix,jnr-unixsocket,jnr-x86asm-1.0,invokebinder,headius-options,jzlib-1.1.3,nailgun-server,joda-time,yecht,bytelist,jcodings,joni-2.1,asm-4,snakeyaml"
JAVA_CLASSPATH_EXTRA="bsf-2.3,coro-mock,jsr292-mock,unsafe-mock,ant-core,joda-timezones,osgi-core-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
