# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-pkg-2

DESCRIPTION="Metapackage for H2O, a distributed, fast & scalable machine learning platform"
HOMEPAGE="https://www.h2o.ai/"

LICENSE="metapackage"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE="flow jetty9-full +target-encoder"

RDEPEND="
	>=virtual/jre-1.8:*
	~dev-java/h2o-app-${PV}:${SLOT}
	flow? ( dev-java/h2o-flow:0 )
	target-encoder? ( ~dev-java/h2o-ext-target-encoder-${PV}:${SLOT} )
	jetty9-full? ( ~dev-java/h2o-jetty9-${PV}:${SLOT} )
	!jetty9-full? ( ~dev-java/h2o-jetty9-minimal-${PV}:${SLOT} )
"

S="${WORKDIR}"

# Let the 'h2o-${SLOT}' command launch h2o-app
JAVA_MAIN_CLASS="water.H2OApp"
JAVA_LAUNCHER_FILENAME="${PN}-${SLOT}"

src_compile() {
	:
}

src_install() {
	java-pkg_register-dependency "h2o-app-${SLOT}"
	use flow && \
		java-pkg_register-dependency "h2o-flow"
	use target-encoder && \
		java-pkg_register-dependency "h2o-ext-target-encoder-${SLOT}"

	if use jetty9-full; then
		java-pkg_register-dependency "h2o-jetty9-${SLOT}"
	else
		java-pkg_register-dependency "h2o-jetty9-minimal-${SLOT}"
	fi

	java-pkg_dolauncher "${JAVA_LAUNCHER_FILENAME}" --main "${JAVA_MAIN_CLASS}"
}
