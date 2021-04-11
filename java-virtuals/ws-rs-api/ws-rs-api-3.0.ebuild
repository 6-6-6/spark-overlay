# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit java-virtuals-2

DESCRIPTION="Virtual for RESTful Web Services"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI=""

LICENSE="public-domain"
SLOT="3"
KEYWORDS="amd64 ~arm ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="|| (
			dev-java/jakarta-ws-rs-api:3
		)"

JAVA_VIRTUAL_PROVIDES="jakarta-ws-rs-api-3"

MAVEN_PROVIDES="javax.ws.rs:javax.ws.rs-api:2.1.6 jakarta.ws.rs:jakarta.ws.rs-api:2.1.6"
