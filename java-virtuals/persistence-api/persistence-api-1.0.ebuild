# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-virtuals-2

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-java/glassfish-persistence"
RDEPEND="${DEPEND}"
BDEPEND=""

MAVEN_PROVIDE="javax.persistence:persistence-api:1.0 "
