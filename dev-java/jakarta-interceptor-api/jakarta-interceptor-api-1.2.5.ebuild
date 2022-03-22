# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# This version provides package javax.interceptor
MAVEN_ID="jakarta.interceptor:jakarta.interceptor-api:${PV}"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A means of interposing on business method invocations and specific events"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.interceptors"
SRC_URI="https://github.com/eclipse-ee4j/interceptor-api/archive/${PV}-RELEASE.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
# Since version 2.0.0, the namespace has changed to jakarta.interceptor
SLOT="1"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="
	dev-java/jakarta-annotation-api:0
	dev-java/jakarta-ejb-api:3
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/interceptor-api-${PV}-RELEASE"

JAVA_SRC_DIR="api/src/main/java"

DOCS=( CONTRIBUTING.md NOTICE.md README.md )

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
