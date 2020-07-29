# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="a proxy to ssh-agent and Pageant in Java."
HOMEPAGE="https://github.com/ymnk/jsch-agent-proxy"
SRC_URI="https://github.com/ymnk/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

MAVEN_ID="com.jcraft:jsch.agentproxy:0.0.8"

MAVEN_PROVIDES="com.jcraft:jsch-agent-proxy-core:0.0.8 com.jcraft:jsch-agent-proxy-connector-factory:0.0.8 com.jcraft:jsch-agent-proxy-jsch:0.0.8 com.jcraft:jsch-agent-proxy-pageant:0.0.8 com.jcraft:jsch-agent-proxy-sshagent:0.0.8 com.jcraft:jsch-agent-proxy-usocket-jna:0.0.8 com.jcraft:jsch-agent-proxy-usocket-nc:0.0.8"

IUSE=""

CDEPEND="
	dev-java/jna:4
	dev-java/jsch:0
	dev-java/slf4j-api:0"

RDEPEND=">=virtual/jre-1.8
	${CDEPEND}"
DEPEND=">=virtual/jdk-1.8
	${CDEPEND}"

S="${WORKDIR}"/${P}
JAVA_SRC_DIR=(
	"jsch-agent-proxy-pageant/src/main/java"
	"jsch-agent-proxy-usocket-jna/src/main/java"
	"jsch-agent-proxy-connector-factory/src/main/java"
	"jsch-agent-proxy-sshagent/src/main/java"
	"jsch-agent-proxy-core/src/main/java"
	"jsch-agent-proxy-usocket-nc/src/main/java"
	"jsch-agent-proxy-jsch/src/main/java"
)

JAVA_GENTOO_CLASSPATH="jna-4,jsch,slf4j-api"
