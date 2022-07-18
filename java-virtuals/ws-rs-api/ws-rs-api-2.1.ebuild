# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-virtuals-2

DESCRIPTION="Virtual for RESTful Web Services"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI=""

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="|| (
			dev-java/jakarta-ws-rs-api
		)"

JAVA_VIRTUAL_PROVIDES="jakarta-ws-rs-api"

MAVEN_PROVIDES="javax.ws.rs:javax.ws.rs-api:2.1.6 jakarta.ws.rs:jakarta.ws.rs-api:2.1.6"
