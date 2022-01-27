# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="org.jruby:jruby-core:1.7.22"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="The effort to recreate the Ruby interpreter in Java"
HOMEPAGE="https://github.com/jruby/jruby/jruby-core"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="LGPL-3 GPL-3 EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jffi:1.2.9 -> >=dev-java/jffi-1.2.9:1.2
# com.github.jnr:jffi:1.2.9 -> >=dev-java/jffi-1.2.9:1.2
# com.github.jnr:jnr-constants:0.8.7 -> >=dev-java/jnr-constants-0.8.7:0
# com.github.jnr:jnr-enxio:0.9 -> >=dev-java/jnr-enxio-0.9:0
# com.github.jnr:jnr-ffi:2.0.3 -> dev-java/jnr-ffi:2
# com.github.jnr:jnr-netdb:1.1.2 -> >=dev-java/jnr-netdb-1.1.4:1.0
# com.github.jnr:jnr-posix:3.0.12 -> dev-java/jnr-posix:3.0
# com.github.jnr:jnr-unixsocket:0.8 -> >=dev-java/jnr-unixsocket-0.8:0
# com.github.jnr:jnr-x86asm:1.0.2 -> >=dev-java/jnr-x86asm-1.0.2:1.0
# com.headius:invokebinder:1.2 -> >=dev-java/invokebinder-1.6:0
# com.headius:options:1.2 -> >=dev-java/headius-options-1.4:0
# com.jcraft:jzlib:1.1.3 -> >=dev-java/jzlib-1.1.3-r2:0
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

RDEPEND="
	>=virtual/jre-1.8:*
	>=dev-java/asm-5.0.3:4
	>=dev-java/bytelist-1.0.15:0
	>=dev-java/headius-options-1.4:0
	>=dev-java/invokebinder-1.6:0
	>=dev-java/jcodings-1.0.13:0
	>=dev-java/jffi-1.2.9:1.2
	>=dev-java/jnr-constants-0.8.7:0
	>=dev-java/jnr-enxio-0.9:0
	dev-java/jnr-ffi:2
	>=dev-java/jnr-netdb-1.1.4:1.0
	dev-java/jnr-posix:3.0
	>=dev-java/jnr-unixsocket-0.8:0
	>=dev-java/jnr-x86asm-1.0.2:1.0
	>=dev-java/joda-time-2.7:0
	>=dev-java/joni-2.1.3:2.1
	>=dev-java/jzlib-1.1.3-r2:0
	>=dev-java/nailgun-server-0.9.1:0
	>=dev-java/snakeyaml-1.16:0
	>=dev-java/yecht-1.0:0
"

JAVA_GENTOO_CLASSPATH="
	asm-4
	bytelist
	headius-options
	invokebinder
	jcodings
	jffi-1.2
	jnr-constants
	jnr-enxio
	jnr-ffi-2
	jnr-netdb-1.0
	jnr-posix-3.0
	jnr-unixsocket
	jnr-x86asm-1.0
	joda-time
	joni-2.1
	jzlib
	nailgun-server
	snakeyaml
	yecht
"

S="${WORKDIR}"
