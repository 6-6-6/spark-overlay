# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="ai.h2o:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="H2O GenModel"
HOMEPAGE="https://www.h2o.ai/"
SRC_URI="
	https://github.com/h2oai/h2o-3/archive/refs/tags/jenkins-${PV}.tar.gz -> h2o-${PV}.tar.gz
	https://repo1.maven.org/maven2/ai/h2o/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/h2o-logger-${PV}:${SLOT}
	>=dev-java/h2o-tree-api-0.3.17:0
	dev-java/gson:2.6
	>=dev-java/opencsv-2.3:0
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

# Needs org.mockito:mockito-core:2.18.3; dev-java/mockito-1.9.5 is incompatible
JAVA_TEST_SRC_DIR="skip-junit-tests-due-to-unpackaged-test-deps"

src_prepare() {
	java-pkg-2_src_prepare
	cat > "${JAVA_SRC_DIR}/water/genmodel/BuildVersion.java" <<- _EOF_ || \
		die "Failed to create the class for build version"
	package water.genmodel;
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
