# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit java-virtuals-2

DESCRIPTION="Virtual for Transaction API (javax.transaction)"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI=""

LICENSE="public-domain"
SLOT="2"
KEYWORDS="amd64 ppc64 x86"
IUSE=""

DEPEND=""
RDEPEND="|| (
				dev-java/jakarta-transaction-api:2
		)
		"

JAVA_VIRTUAL_PROVIDES="jakarta-transaction-api-2"

MAVEN_PROVIDES="jakarta.transaction:jakarta.transaction-api:2.0.0-RC1"
