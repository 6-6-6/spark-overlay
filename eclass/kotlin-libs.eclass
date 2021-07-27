# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: kotlin-libs.eclass
# @MAINTAINER:
# Yuan Liao <liaoyuan@gmail.com>
# @AUTHOR:
# Yuan Liao <liaoyuan@gmail.com>
# @SUPPORTED_EAPIS: 6 7
# @BLURB: An eclass for building Kotlin library packages
# @DESCRIPTION:
# This eclass provides an abstraction of the Kotlin compiler to support
# building Kotlin library packages. It inherits kotlin-utils.eclass and
# recognizes variables declared by that eclass when appropriate.

case "${EAPI:-0}" in
	6|7) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

EXPORT_FUNCTIONS pkg_setup src_unpack src_compile src_test src_install

# Allow use of EAPI 7 version manipulators in older EAPIs for both this eclass
# and consumer ebuilds
[[ "${EAPI:-0}" -eq 6 ]] && inherit eapi7-ver

# Options that control MANIFEST.MF in resulting JAR

# @ECLASS-VARIABLE: KOTLIN_LIBS_RUNTIME_COMPONENT
# @DEFAULT_UNSET
# @DESCRIPTION:
# The value used in the 'Kotlin-Runtime-Component' field in the MANIFEST.MF
# file for the package. Default is unset, can be overridden from ebuild
# anywhere. Once a value is set, a full MANIFEST.MF with additional fields like
# 'Implementation-Title' and 'Kotlin-Version' will be created for consistency
# with the upstream.  The set of values that the upstream can use for this
# field includes 'Main' and 'Test'.

# ebuild variables

# @ECLASS-VARIABLE: KOTLIN_LIBS_BINJAR_SRC_URI
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# The SRC_URI of the binary JAR file to be installed if the 'binary' USE flag
# is enabled. Default is unset, can be overridden from ebuild BEFORE inheriting
# this eclass. Once a value is set, this eclass will add 'binary' and 'test'
# USE flags to it and automatically set 'KOTLIN_TESTING_FRAMEWORKS+=" pkgdiff"'
# to use the binary JAR for testing.

# @ECLASS-VARIABLE: KOTLIN_LIBS_SRCJAR_SRC_URI
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# The SRC_URI of the source JAR file to be installed if the 'binary' and
# 'source' USE flags are both enabled. Default is unset, can be overridden from
# ebuild BEFORE inheriting this eclass. If KOTLIN_LIBS_BINJAR_SRC_URI is set
# but this variable is unset, this eclass will set
# 'REQUIRED_USE="binary? ( !source )"' for the ebuild.

# @ECLASS-VARIABLE: KOTLIN_LIBS_SRCJAR_FILENAME
# @DEFAULT_UNSET
# @DESCRIPTION:
# The name of the source JAR file to be installed if the 'binary' and 'source'
# USE flags are both enabled. Must be overridden from ebuild somewhere when
# KOTLIN_LIBS_SRCJAR_SRC_URI is set.

# Testing

JAVA_PKG_IUSE="source"
_KOTLIN_LIBS_REQUIRED_USE=""

if [[ -n "${KOTLIN_LIBS_BINJAR_SRC_URI}" ]]; then
	# The binary JAR can be used for pkgdiff tests when the package is built
	# from source
	JAVA_PKG_IUSE+=" binary"
	KOTLIN_IUSE+=" test"
	KOTLIN_TESTING_FRAMEWORKS+=" pkgdiff"
	if [[ -z "${KOTLIN_LIBS_SRCJAR_SRC_URI}" ]]; then
		# No source JAR is available for the binary JAR, disable the USE flag
		_KOTLIN_LIBS_REQUIRED_USE="binary? ( !source )"
	fi
fi

inherit kotlin-utils

# ebuild metadata variables

: ${DESCRIPTION:="Kotlin library component ${PN}"}
: ${HOMEPAGE:="https://kotlinlang.org"}
: ${LICENSE:="Apache-2.0 BSD MIT NPL-1.1"}
: ${SLOT:="$(ver_cut 1-2)"}

REQUIRED_USE="
	${_KOTLIN_LIBS_REQUIRED_USE}
	${REQUIRED_USE}
"

S="${WORKDIR}/kotlin-${PV}"

# Source URI

_KOTLIN_LIBS_DEFAULT_SRC_URI="
	https://github.com/JetBrains/kotlin/archive/refs/tags/v${PV}.tar.gz -> kotlin-${PV}.tar.gz
"
if has binary ${JAVA_PKG_IUSE}; then
	: ${SRC_URI:=""}
	if has junit-4 ${KOTLIN_TESTING_FRAMEWORKS}; then
		# Unpack source archive to compile and run the test suite in it
		_KOTLIN_LIBS_TEST_SRC="test? ( ${_KOTLIN_LIBS_DEFAULT_SRC_URI} )"
	fi
	SRC_URI+="
	!binary? (
		${_KOTLIN_LIBS_DEFAULT_SRC_URI}
		test? ( ${KOTLIN_LIBS_BINJAR_SRC_URI} )
	)
	binary? (
		${KOTLIN_LIBS_BINJAR_SRC_URI}
		source? ( ${KOTLIN_LIBS_SRCJAR_SRC_URI} )
		${_KOTLIN_LIBS_TEST_SRC}
	)
	"
else
	: ${SRC_URI:="${_KOTLIN_LIBS_DEFAULT_SRC_URI}"}
fi

# Dependencies

DEPEND=">=virtual/jdk-1.8:*"
RDEPEND=">=virtual/jre-1.8:*"

case "${SLOT}" in
	1.4)
		KOTLIN_VERSIONS=">=1.4"
		KOTLIN_VERSIONS_PREF_ORDER=( 1.{4..6} )
		;;
	1.5)
		KOTLIN_VERSIONS=">=1.5"
		KOTLIN_VERSIONS_PREF_ORDER=( 1.{5..6} )
		;;
	# Provision for the next feature release
	1.6)
		KOTLIN_VERSIONS=">=1.6"
		KOTLIN_VERSIONS_PREF_ORDER=( 1.6 )
		;;
esac

_KOTLIN_LIBS_DEPEND="$(
	DEPEND=""
	kotlin-utils_set_kotlin_depend
	echo "${DEPEND}"
)"
if has binary ${JAVA_PKG_IUSE}; then
	# Depend on the compiler only when building from source
	DEPEND+=" !binary? ( ${_KOTLIN_LIBS_DEPEND} )"
	if has junit-4 ${KOTLIN_TESTING_FRAMEWORKS}; then
		DEPEND+=" test? ( ${_KOTLIN_LIBS_DEPEND} )"
	fi
else
	# No option to use pre-built binary; always depend on the compiler
	DEPEND+=" ${_KOTLIN_LIBS_DEPEND}"
fi

kotlin-utils_set_test_depend

# kotlin-utils.eclass variables

KOTLIN_KOTLINC_JAVA_OPTS="-Xmx768M"
KOTLIN_JAVA_WANT_SOURCE_TARGET="1.6"
KOTLIN_WANT_TARGET="${SLOT}"
KOTLIN_TEST_KOTLINC_JAVA_OPTS="${KOTLIN_KOTLINC_JAVA_OPTS}"

# Unset temporary variables

unset _KOTLIN_LIBS_REQUIRED_USE
unset _KOTLIN_LIBS_DEFAULT_SRC_URI
unset _KOTLIN_LIBS_TEST_SRC
unset _KOTLIN_LIBS_DEPEND

# @FUNCTION: kotlin-libs_pkg_setup
# @DESCRIPTION:
# Selects the Kotlin compiler to be used for building this package.
kotlin-libs_pkg_setup() {
	java-pkg-2_pkg_setup
	if ! has binary ${JAVA_PKG_IUSE} || ! use binary; then
		kotlin-utils_pkg_setup
	fi
}

# @FUNCTION: kotlin-libs_src_unpack
# @DESCRIPTION:
# Unpacks all source files except the binary JAR or the source JAR, then
# ensures ${S} exists. ${S} is created only if the Kotlin project's source
# repository archive is unpacked; the archive might not be unpacked if the
# 'binary' USE flag is enabled, thus ${S} might be absent in this case.
kotlin-libs_src_unpack() {
	for f in ${A}; do
		case "${f}" in
			${JAVA_BINJAR_FILENAME}|${KOTLIN_LIBS_SRCJAR_FILENAME})
				;;
			*)
				unpack "${f}"
				;;
		esac
	done

	mkdir -p "${S}" || die "Failed to create \${S}"
}

# @FUNCTION: kotlin-libs_create_manifest
# @USAGE: <destination_dir>
# @DESCRIPTION:
# Creates an appropriate manifest for the package under
# <destination_dir>/META-INF/MANIFEST.MF.
kotlin-libs_create_manifest() {
	debug-print-function ${FUNCNAME} "$@"

	[[ $# -ne 1 ]] && die "${FUNCNAME[0]} takes exactly one argument"
	mkdir -p "$1/META-INF" || die "Failed to create the META-INF directory"
	cat <<- _EOF_ \
		> "$1/META-INF/MANIFEST.MF" || die "Failed to create MANIFEST.MF"
	Implementation-Title: ${PN}
	Kotlin-Runtime-Component: ${KOTLIN_LIBS_RUNTIME_COMPONENT}
	Kotlin-Version: ${SLOT}
	Implementation-Version: ${PVR}
	Implementation-Vendor: Gentoo
	_EOF_
}

# @FUNCTION: kotlin-libs_src_compile
# @DESCRIPTION:
# Compiles the source files in ${KOTLIN_LIBS_SRC_DIR} using compiler arguments
# specified by other variables of this eclass, with classpath calculated from
# ${JAVA_GENTOO_CLASSPATH}, and packages the resulting classes to a single JAR
# ${JAVA_JAR_FILENAME}. If the file target/META-INF/MANIFEST.MF exists, it will
# be used as the manifest of the created JAR. If the 'binary' USE flag is
# enabled, nothing will be compiled and the binary JAR ${JAVA_BINJAR_FILENAME}
# will be used directly.
kotlin-libs_src_compile() {
	if has binary ${JAVA_PKG_IUSE} && use binary; then
		java-pkg_gen-cp JAVA_GENTOO_CLASSPATH
		for dependency in ${JAVA_GENTOO_CLASSPATH//,/ }; do
			java-pkg_record-jar_ "${dependency}"
		done

		cp "${DISTDIR}/${JAVA_BINJAR_FILENAME}" "${JAVA_JAR_FILENAME}" \
			|| die "Could not copy the binary JAR file to ${S}"
		return 0
	fi

	kotlin-utils_src_compile

	# Create MANIFEST.MF if needed
	if [[ "${KOTLIN_LIBS_RUNTIME_COMPONENT}" ]]; then
		kotlin-libs_create_manifest "${KOTLIN_UTILS_CLASSES}"
	fi

	kotlin-utils_jar
}

# @FUNCTION: kotlin-libs_src_test
# @DESCRIPTION:
# If the package is being built from source but a binary JAR is still
# available, compares it with the JAR just built.
kotlin-libs_src_test() {
	if ! has test ${KOTLIN_IUSE}; then
		return
	elif ! use test; then
		return
	elif [[ -z "${KOTLIN_TESTING_FRAMEWORKS}" ]]; then
		return
	fi

	for framework in ${KOTLIN_TESTING_FRAMEWORKS}; do
		case "${framework}" in
			junit-4)
				kotlin-utils_test_compile
				ejunit4 -classpath "${KOTLIN_UTILS_TEST_CLASSPATH}" \
					${KOTLIN_UTILS_TESTS_TO_RUN} ;;
			pkgdiff)
				if has binary ${JAVA_PKG_IUSE} && use binary; then
					elog "Skipping pkgdiff tests because they will always pass"
					elog "due to USE=binary"
				else
					java-pkg-simple_test_with_pkgdiff_
				fi
				;;
			*)
				elog "Testing framework ${framework} is not supported yet" ;;
		esac
	done
}

# @FUNCTION: kotlin-libs_dosrc
# @USAGE: <path/to/sources> [...]
# @DESCRIPTION:
# Installs a Zip archive containing the specified sources for a package.
kotlin-libs_dosrc() {
	debug-print-function ${FUNCNAME} "$@"

	java-pkg_check-phase install

	[[ "$#" -lt 1 ]] && die "At least one argument needed for ${FUNCNAME}"

	if [[ "${DEPEND}" != *app-arch/zip* ]]; then
		local msg="${FUNCNAME} called without app-arch/zip in DEPEND"
		java-pkg_announce-qa-violation "${msg}"
	fi

	java-pkg_init_paths_

	local zip_name="${PN}-src.zip"
	local zip_path="${T}/${zip_name}"
	local path
	for path in "$@"; do
		local dir_parent=$(dirname "${path}")
		local dir_name=$(basename "${path}")
		pushd "${dir_parent}" > /dev/null || \
			die "Failed to enter directory ${dir_parent}"
		zip -q -r "${zip_path}" "${dir_name}"
		local result=$?
		# 12 means zip has nothing to do
		if [[ "${result}" != 12 && "${result}" != 0 ]]; then
			die "Failed to add ${dir_name} to Zip archive"
		fi
		popd > /dev/null || die "Failed to exit directory ${dir_parent}"
	done

	insinto "${JAVA_PKG_SOURCESPATH}"
	doins "${zip_path}"

	if [[ -n "${JAVA_PKG_DEBUG}" ]]; then
		einfo "Verbose logging for \"${FUNCNAME}\" function"
		einfo "Zip filename created: ${zip_name}"
		einfo "Zip file destination: ${JAVA_PKG_SOURCESPATH}"
		einfo "Paths zipped: $@"
		einfo "Complete command:"
		einfo "${FUNCNAME} $@"
	fi

	JAVA_SOURCES="${JAVA_PKG_SOURCESPATH}/${zip_name}"
	java-pkg_do_write_
}

# @FUNCTION: kotlin-libs_src_install
# @DESCRIPTION:
# Installs the JAR specified by ${JAVA_JAR_FILENAME}, and a launcher as well if
# ${JAVA_MAIN_CLASS} is set. If the 'source' USE flag is enabled, a Zip archive
# containing the source will also be installed.
kotlin-libs_src_install() {
	local sources
	if [[ -s "java_sources.lst" ]]; then
		sources="sources.lst"
		cat kotlin_sources.lst java_sources.lst > "${sources}" || \
			die "Failed to create combined Kotlin and Java source list"
	elif [[ -s "kotlin_sources.lst" ]]; then
		sources="kotlin_sources.lst"
	else
		# Fall back to the source list file used by java-pkg-simple.eclass
		sources="sources.lst"
	fi

	java-pkg_dojar "${JAVA_JAR_FILENAME}"

	if [[ -n "${JAVA_MAIN_CLASS}" ]]; then
		java-pkg_dolauncher "${JAVA_LAUNCHER_FILENAME}" \
			--main "${JAVA_MAIN_CLASS}"
	fi

	if has source ${JAVA_PKG_IUSE} && use source; then
		if has binary ${JAVA_PKG_IUSE} && use binary; then
			# Install pre-built source JAR for binary installation
			insinto "${JAVA_PKG_SOURCESPATH}"
			doins "${DISTDIR}/${KOTLIN_LIBS_SRCJAR_FILENAME}"
		else
			local srcdirs=""
			local kt_java_src_dir=(
				"${KOTLIN_SRC_DIR[@]}"
				"${KOTLIN_JAVA_SOURCE_ROOTS[@]}"
			)
			if [[ -n "${kt_java_src_dir[@]}" ]]; then
				local parent child
				for parent in "${kt_java_src_dir[@]}"; do
					srcdirs="${srcdirs} ${parent}"
				done
			else
				# Take all directories actually containing any sources
				srcdirs="$(cut -d/ -f1 ${sources} | sort -u)"
			fi
			kotlin-libs_dosrc ${srcdirs}
		fi
	fi
}
