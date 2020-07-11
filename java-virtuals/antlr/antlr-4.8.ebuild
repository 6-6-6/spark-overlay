# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit java-virtuals-2

DESCRIPTION="Virtual for servlet api"
HOMEPAGE="https://jcp.org/en/jsr/detail?id=340"
SRC_URI=""

LICENSE="public-domain"
SLOT="4"
KEYWORDS="amd64 ~arm64 ppc64 x86"

RDEPEND="|| (
		dev-java/antlr:${SLOT}
		dev-java/tunnelvisionlabs-antlr:${SLOT}
	)"

JAVA_VIRTUAL_PROVIDES="antlr-4,tunnelvisionlabs-antlr-4"

MAVEN_PROVIDES="com.tunnelvisionlabs:antlr4:4.7.4 com.tunnelvisionlabs:antlr4-runtime:4.7.4 com.tunnelvisionlabs:antlr4-annotations:4.7.4 org.antlr:antlr4:4.7.4 org.antlr:antlr4-runtime:4.7.4"
