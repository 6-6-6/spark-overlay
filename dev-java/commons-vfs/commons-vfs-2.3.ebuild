# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="A single API for accessing various different file systems"
HOMEPAGE="http://commons.apache.org/vfs/"
SRC_URI="mirror://apache/commons/vfs/source/${P}-src.tar.gz"

LICENSE="Apache-2.0"
SLOT="2"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

#	app-maven/hadoop-hdfs-client:0
CDEPEND="
	app-maven/hadoop-common:0
	app-maven/hadoop-hdfs:0

	dev-java/ant-core:0
	dev-java/commons-collections:4
	dev-java/commons-compress:0
	dev-java/commons-logging:0
	dev-java/commons-net:0
	dev-java/commons-httpclient:3
	dev-java/httpcomponents-client:4.5
	dev-java/httpcomponents-core:4.4
	dev-java/jackrabbit-webdav:0
	dev-java/jsch:0
	"

RDEPEND=">=virtual/jre-1.8
	${CDEPEND}"

DEPEND=">=virtual/jdk-1.8
	${CDEPEND}"

S="${WORKDIR}/${P}/commons-vfs2"

java_prepare() {
#	epatch "${FILESDIR}"/${P}-incompatibility.patch

	cp "${FILESDIR}"/${P}-build.xml build.xml || die

	java-ant_rewrite-classpath
	java-ant_ignore-system-classes
}

EANT_GENTOO_CLASSPATH="
	hadoop-common
	hadoop-hdfs
	ant-core
	commons-collections-4
	commons-compress
	commons-logging
	commons-net
	commons-httpclient-3
	httpcomponents-client-4.5
	httpcomponents-core-4.4
	jackrabbit-webdav
	jsch
"
EANT_EXTRA_ARGS="-Dlibdir=${T}"

# The build.xml is generated from maven and can't run the tests properly
# Use maven test to execute these manually but that means downloading deps from
# the internet. Also the tests need to login to some ftp servers and samba
# shares so I doubt they work for everyone.
#src_test() {
#	ANT_TASKS="ant-junit" eant test
#}

src_install() {
	java-pkg_newjar target/*.jar

	use doc && java-pkg_dojavadoc target/site/apidocs
	use source && java-pkg_dosrc src/main/java
}
