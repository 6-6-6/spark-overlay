# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# This version provides package javax.ejb
MAVEN_ID="jakarta.ejb:jakarta.ejb-api:${PV}"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Enterprise Beans"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.ejb"
SRC_URI="https://github.com/jakartaee/enterprise-beans/archive/${PV}-RELEASE.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
# Since version 4.0.0, the namespace has changed to jakarta.ejb
SLOT="3"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="
	>=dev-java/glassfish-xmlrpc-api-1.1.1-r1:0
	dev-java/jta:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/enterprise-beans-${PV}-RELEASE"

JAVA_SRC_DIR="api/src/main/java"

DOCS=( CONTRIBUTING.md NOTICE.md README.md )

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
