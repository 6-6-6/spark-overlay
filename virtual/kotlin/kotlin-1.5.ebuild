# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual for Kotlin compiler"

SLOT="${PV}"
KEYWORDS="~amd64"
IUSE="javascript"

RDEPEND="|| (
	dev-lang/kotlin:${SLOT}[javascript=]
	dev-lang/kotlin-bin:${SLOT}[javascript=]
)"
