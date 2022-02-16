# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="H2O Python Package"
HOMEPAGE="https://www.h2o.ai/"
SRC_URI="https://github.com/h2oai/h2o-3/archive/refs/tags/jenkins-${PV}.tar.gz -> h2o-${PV}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
# Tests require a monolithic h2o.jar containing all H2O modules and plugins
RESTRICT="test"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
"

DEPEND="
	${RDEPEND}
"

S="${WORKDIR}/h2o-3-jenkins-${PV}/${PN}"

src_prepare() {
	distutils-r1_src_prepare

	# Required by the build system for obtaining the version being built
	# Use '-n' to avoid the version normalization QA warning
	echo -n "${PV}" > "h2o/version.txt" || die "Failed to create version.txt"
}
