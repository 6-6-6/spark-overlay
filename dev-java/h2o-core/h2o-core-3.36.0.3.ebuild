# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="ai.h2o:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple readme.gentoo-r1

DESCRIPTION="The core module of H2O, a distributed, fast & scalable machine learning platform"
HOMEPAGE="https://www.h2o.ai/"
SRC_URI="
	https://github.com/h2oai/h2o-3/archive/refs/tags/jenkins-${PV}.tar.gz -> h2o-${PV}.tar.gz
	https://repo1.maven.org/maven2/ai/h2o/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/h2o-genmodel-${PV}:${SLOT}
	~dev-java/h2o-jaas-pam-${PV}:${SLOT}
	~dev-java/h2o-logger-${PV}:${SLOT}
	~dev-java/h2o-logging-impl-log4j2-${PV}:${SLOT}
	~dev-java/h2o-webserver-iface-${PV}:${SLOT}
	>=dev-java/commons-io-2.4:1
	>=dev-java/commons-lang-2.6:2.1
	dev-java/commons-math:3
	>=dev-java/duke-1.2:0
	dev-java/gson:2.6
	>=dev-java/jama-1.0.3:0
	dev-java/javassist:3
	dev-java/jmh-core:0
	dev-java/jmh-generator-annprocess:0
	>=dev-java/joda-time-2.9.9:0
	dev-java/jtransforms:3.1
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/h2o-3-jenkins-${PV}/${PN}"

JAVA_RESOURCE_DIRS="src/main/resources"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TEST_SRC_DIR="skip-junit-tests-due-to-unpackaged-test-deps"

src_prepare() {
	java-pkg-2_src_prepare
	cat > "${JAVA_SRC_DIR}/water/init/BuildVersion.java" <<- _EOF_ || \
		die "Failed to create the class for build version"
	package water.init;
	public class BuildVersion extends AbstractBuildVersion {
		public String branchName()     { return "jenkins-${PV}"; }
		public String lastCommitHash() { return "(not available)"; }
		public String describe()       { return "${PVR}-gentoo"; }
		public String projectVersion() { return "${PV}"; }
		public String compiledOn()     { return "$(date '+%F %T')"; }
		public String compiledBy()     { return "$(id -un)"; }
	}
	_EOF_
}

DOC_CONTENTS="
Since H2O 3.36, this package no longer registers an H2O Jetty module
as an optional dependency.  This may cause a \"No implementation of
HttpServerFacade found on classpath\" error when any H2O modules are
used by libraries and programs other than the 'h2o-${SLOT}' command
provided by dev-java/h2o:${SLOT}.  To fix this error, please install
one of the following packages and add it to the classpath:\n
- dev-java/h2o-jetty9-minimal:${SLOT}\n
- dev-java/h2o-jetty9:${SLOT}\n
\n
In addition, since H2O 3.36, this package no longer registers
'water.H2O' as the main class.  As a side effect, the '${PN}-${SLOT}'
command is no longer available.  Users are encouraged to install
dev-java/h2o:${SLOT} and use the 'h2o-${SLOT}' command to launch
H2O ${SLOT}.
"

src_install() {
	java-pkg-simple_src_install
	readme.gentoo_create_doc
}

pkg_postinst() {
	FORCE_PRINT_ELOG=1
	# Print log upon first installation in this slot
	has_version "<${CATEGORY}/${PN}-${SLOT}" && \
		[[ -z "${REPLACING_VERSIONS}" ]] && readme.gentoo_print_elog
}
