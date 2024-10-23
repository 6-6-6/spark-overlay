# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"
MAVEN_ID="jakarta.json:jakarta.json-api:2.1.3"

inherit java-pkg-2 java-pkg-simple

MY_PN="jsonp-api"
MY_PV="${PV}-RELEASE"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="JSR 374 (JSON Processing) API"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jsonp"
SRC_URI="https://github.com/eclipse-ee4j/jsonp/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
# Since version 2.0.0, the namespace has changed to jakarta.json
SLOT="2"
KEYWORDS="amd64 ~arm arm64 ppc64 x86"

DEPEND=">=virtual/jdk-11:*"
RDEPEND=">=virtual/jre-1.8:*"

S="${WORKDIR}/${MY_P}"

JAVA_SRC_DIR="api/src/main"

DOCS=( CONTRIBUTING.md NOTICE.md README.md )
