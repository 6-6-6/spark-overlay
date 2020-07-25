# Copyright 2004-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: java-pkg-simple.eclass
# @MAINTAINER:
# java@gentoo.org
# @AUTHOR:
# Java maintainers (java@gentoo.org)
# @BLURB: Eclass for packaging Java software with ease.
# @DESCRIPTION:
# This class is intended to build pure Java packages from Java sources
# without the use of any build instructions shipped with the sources.
# There is no support for resources besides the generated class files,
# or for generating source files, or for controlling the META-INF of
# the resulting jar, although these issues may be addressed by an
# ebuild by putting corresponding files into the target directory
# before calling the src_compile function of this eclass.

inherit java-utils-2

if ! has java-pkg-2 ${INHERITED}; then
	eerror "java-pkg-simple eclass can only be inherited AFTER java-pkg-2"
fi

EXPORT_FUNCTIONS src_compile src_install src_test

# We are only interested in finding all java source files, wherever they may be.
S="${WORKDIR}"

DEPEND="test? ( dev-util/japi-compliance-checker:0 )"

# @ECLASS-VARIABLE: JAVA_GENTOO_CLASSPATH
# @DEFAULT_UNSET
# @DESCRIPTION:
# Comma or space separated list of java packages to include in the
# class path. The packages will also be registered as runtime
# dependencies of this new package. Dependencies will be calculated
# transitively. See "java-config -l" for appropriate package names.
#
# @CODE
#	JAVA_GENTOO_CLASSPATH="foo,bar-2"
# @CODE

# @ECLASS-VARIABLE: JAVA_GENTOO_CLASSPATH_EXTRA
# @DEFAULT_UNSET
# @DESCRIPTION:
# Extra list of colon separated path elements to be put on the
# classpath when compiling sources.

# @ECLASS-VARIABLE: JAVA_CLASSPATH_EXTRA
# @DEFAULT_UNSET
# @DESCRIPTION:
# An extra comma or space separated list of java packages
# that are needed only during compiling sources.

# @ECLASS-VARIABLE: JAVA_NEEDS_TOOLS
# @DEFAULT_UNSET
# @DESCRIPTION:
# add tools.jar to the gentoo.classpath. Should only be used
#       for build-time purposes, the dependency is not recorded to
#       package.env!

# @ECLASS-VARIABLE: JAVA_SRC_DIR
# @DEFAULT_UNSET
# @DESCRIPTION:
# Directories relative to ${S} which contain the sources of the
# application. The default of "" will be treated mostly as ${S}
# itself. For the generated source package (if source is listed in
# ${JAVA_PKG_IUSE}), it is important that these directories are
# actually the roots of the corresponding source trees.
#
# @CODE
#	JAVA_SRC_DIR="src/java/org/gentoo"
# @CODE

# @DESCRIPTION:
# @ECLASS-VARIABLE: JAVA_RESOURCE_DIRS
# @DEFAULT_UNSET
# @DESCRIPTION:
# Directories relative to ${S} which contain the resources of
# the application. If you do not set the variable, there will
# be no resources added to the compiled jar file.
#
# @CODE
#	JAVA_RESOURCE_DIRS=("src/java/resources/")
# @CODE

# @ECLASS-VARIABLE: JAVA_ENCODING
# @DESCRIPTION:
# The character encoding used in the source files.
: ${JAVA_ENCODING:=UTF-8}

# @ECLASS-VARIABLE: JAVAC_ARGS
# @DEFAULT_UNSET
# @DESCRIPTION:
# Additional arguments to be passed to javac.

# @ECLASS-VARIABLE: JAVA_MAIN_CLASS
# @DEFAULT_UNSET
# @DESCRIPTION:
# If the java has a main class, you are going to set the
# variable so that we can generate a proper MANIFEST.MF
# and create a launcher.
#
# @CODE
#	JAVA_MAIN_CLASS="org.gentoo.java.ebuilder.Main"
# @CODE

# @ECLASS-VARIABLE: JAVADOC_ARGS
# @DEFAULT_UNSET
# @DESCRIPTION:
# Additional arguments to be passed to javadoc.

# @ECLASS-VARIABLE: JAVA_JAR_FILENAME
# @DESCRIPTION:
# The name of the jar file to create and install.
: ${JAVA_JAR_FILENAME:=${PN}.jar}

# @ECLASS-VARIABLE: JAVA_BINJAR_FILENAME
# @DEFAULT_UNSET
# @DESCRIPTION:
# The name of the binary jar file to be compared during src_test
# and to be installed if USE FLAG 'binary' is set.

# @ECLASS-VARIABLE: JAVA_LAUNCHER_FILENAME
# @DESCRIPTION:
# If ${JAVA_MAIN_CLASS} is set, we will create a launcher to
# execute the jar, and ${JAVA_LAUNCHER_FILENAME} will be the
# name of the script.
: ${JAVA_LAUNCHER_FILENAME:=${PN}-${SLOT}}

# @ECLASS-VARIABLE: JAVA_TESTING_FRAMEWORK
# @DEFAULT_UNSET
# @DESCRIPTION:
# The test framework that we will launch during src_test.
# Currently, the only option is "junit".
#
# @CODE
# JAVA_TESTING_FRAMEWORK="junit"
# @CODE

# @ECLASS-VARIABLE: JAVA_GENTOO_TEST_CLASSPATH
# @DEFAULT_UNSET
# @DESCRIPTION:
# The extra classpath we need while compiling and running the
# source code for testing.

# @ECLASS-VARIABLE: JAVA_TEST_SRC_DIR
# @DEFAULT_UNSET
# Directories relative to ${S} which contain the sources of the
# test. It is almost equivalent to ${JAVA_SRC_DIR} in src_test.

# @DESCRIPTION:
# @ECLASS-VARIABLE: JAVA_TEST_RESOURCE_DIRS
# @DEFAULT_UNSET
# It is almost equivalent to ${JAVA_RESOURCE_DIRS} in src_test.

# @FUNCTION: java-pkg-simple_get-jars
# @DESCRIPTION:
# generate ${classpath} from ${JAVA_GENTOO_CLASSPATH_EXTRA},
# ${JAVA_NEEDS_TOOLS}, ${JAVA_CLASSPATH_EXTRA} and
# ${JAVA_GENTOO_CLASSPATH}. We may use it inside src_compile
# and src_test.
java-pkg-simple_get-jars() {
	local denpendency
	local deep_jars="--with-dependencies"
	local buildonly_jars="--build-only"

	debug-print-function ${FUNCNAME} $*

	# the extra classes that are not installed by portage
	classpath+=":${JAVA_GENTOO_CLASSPATH_EXTRA}"

	# whether we need tools.jar
	[[ ${JAVA_NEEDS_TOOLS} ]] && classpath+=":$(java-config --tools)"

	# the extra classes that are installed by portage
	for dependency in ${JAVA_CLASSPATH_EXTRA}; do
		classpath="${classpath}:$(java-pkg_getjars ${buildonly_jars}\
			${deep_jars} ${dependency})" \
			|| die "getjars failed for ${dependency}"
	done

	# add test dependencies, build-only flag is enabled
	#   so it will not cause problems
	for dependency in ${JAVA_GENTOO_TEST_CLASSPATH}; do
		classpath="${classpath}:$(java-pkg_getjars ${buildonly_jars}\
			${deep_jars} ${dependency})" \
			|| die "getjars failed for ${dependency}"
	done

	# add the RUNTIME dependencies
	for dependency in ${JAVA_GENTOO_CLASSPATH}; do
		classpath="${classpath}:$(java-pkg_getjars ${deep_jars} ${dependency})"\
			|| die "getjars failed for ${dependency}"
	done

	# purify classpath
	while [[ $classpath = *::* ]]; do classpath="${classpath//::/:}"; done
	classpath=${classpath%:}
	classpath=${classpath#:}

	debug-print "CLASSPATH=${classpath}"
}

# @FUNCTION: java-pkg-simple_junit-test
# @DESCRIPTION:
# Compile source files in ${JAVA_TEST_SRC_DIR}, and launch
# test using ejunit4.
# NOTICE: If you want to launch a junit-based test, please
# specify a suitable package in ${JAVA_GENTOO_TEST_CLASSPATH}.
java-pkg-simple_junit-test() {
	local tests_to_run

	debug-print-function ${FUNCNAME} $*

	tests_to_run=$(find "${classes}" \-type f\
		-name "*Test.class" ! -name "Abstract*" ! -name "*\$*")
	tests_to_run=${tests_to_run//"${classes}"\/}
	tests_to_run=${tests_to_run//.class}
	tests_to_run=${tests_to_run//\//.}

	ejunit4 -classpath ${classpath} ${tests_to_run}

}

# @FUNCTION: java-pkg-simple_prepend-resources
# @DESCRIPTION:
# Accept "${JAVA_RESOURCE_DIRS[@]}" or "${JAVA_TEST_RESOURCE_DIRS[@]}"
# and prepend the directories in the array to ${classpath}.
java-pkg-simple_prepend-resources() {
	local resources=("${@}")

	debug-print-function ${FUNCNAME} $*

	# add resources directory to classpath
	for resource in "${resources[@]}"; do
		classpath+=":${resource}"
	done

	# purify classpath
	while [[ $classpath = *::* ]]; do classpath="${classpath//::/:}"; done
	classpath=${classpath%:}
	classpath=${classpath#:}

	debug-print "CLASSPATH=${classpath}"
}

# @FUNCTION: java-pkg-simple_src_compile
# @DESCRIPTION:
# src_compile for simple bare source java packages. Finds all *.java
# sources in ${JAVA_SRC_DIR}, compiles them with the classpath
# calculated from ${JAVA_GENTOO_CLASSPATH}, and packages the resulting
# classes to a single ${JAVA_JAR_FILENAME}. If the file
# target/META-INF/MANIFEST.MF exists, it is used as the manifest of the
# created jar.
java-pkg-simple_src_compile() {
	local sources=sources.lst classes=target/classes apidoc=target/api

	# auto generate classpath
	java-pkg_gen-cp JAVA_GENTOO_CLASSPATH

	# do not compile if we decide to install binary jar
	if has binary ${JAVA_PKG_IUSE} && use binary; then
		return 0
	fi

	# gather sources
	find ${JAVA_SRC_DIR:-*} -name \*.java > ${sources}

	mkdir -p ${classes} || die "Could not create target directory"

	# compile
	local classpath=""
	java-pkg-simple_get-jars
	java-pkg-simple_prepend-resources "${JAVA_RESOURCE_DIRS[@]}"

	ejavac -d ${classes} -encoding ${JAVA_ENCODING} \
		${classpath:+-classpath ${classpath}} ${JAVAC_ARGS} \
		@${sources}

	# javadoc
	if has doc ${JAVA_PKG_IUSE} && use doc; then
		mkdir -p ${apidoc}
		ejavadoc -d ${apidoc} \
			-encoding ${JAVA_ENCODING} -docencoding UTF-8 -charset UTF-8 \
			${classpath:+-classpath ${classpath}} ${JAVADOC_ARGS:- -quiet} \
			@${sources} || die "javadoc failed"
	fi


	# package
	local jar_args
	if [[ -e ${classes}/META-INF/MANIFEST.MF ]]; then
		jar_args="cfm ${JAVA_JAR_FILENAME} ${classes}/META-INF/MANIFEST.MF"
	elif [[ ${JAVA_MAIN_CLASS} ]]; then
		jar_args="cfe ${JAVA_JAR_FILENAME} ${JAVA_MAIN_CLASS}"
	else
		jar_args="cf ${JAVA_JAR_FILENAME}"
	fi
	jar ${jar_args} -C ${classes} . || die "jar failed"

	# prepend resources
	for resource in "${JAVA_RESOURCE_DIRS[@]}"; do
		jar uf ${JAVA_JAR_FILENAME} -C "${resource:-.}" .\
			|| die "Failed to add resources to ${JAVA_JAR_FILENAME}"
	done
}

# @FUNCTION: java-pkg-simple_src_install
# @DESCRIPTION:
# src_install for simple single jar java packages. Simply installs
# ${JAVA_JAR_FILENAME} or ${JAVA_BINJAR_FILENAME} if "binary" is set.
# It will also install a launcher if ${JAVA_MAIN_CLASS} is set.
java-pkg-simple_src_install() {
	local sources=sources.lst classes=target/classes apidoc=target/api

	# install the jar file that we need
	if has binary ${JAVA_PKG_IUSE} && use binary; then
		java-pkg_dojar "${DISTDIR}"/${JAVA_BINJAR_FILENAME}
	else
		# main jar
		java-pkg_dojar ${JAVA_JAR_FILENAME}
	fi

	# install a wrapper if ${JAVA_MAIN_CLASS} is defined
	if [[ ${JAVA_MAIN_CLASS} ]]; then
		java-pkg_dolauncher "${JAVA_LAUNCHER_FILENAME}" --main ${JAVA_MAIN_CLASS}
	fi

	# javadoc
	if has doc ${JAVA_PKG_IUSE} && use doc; then
		java-pkg_dojavadoc ${apidoc}
	fi

	# dosrc
	if has source ${JAVA_PKG_IUSE} && use source; then
		local srcdirs=""
		if [[ ${JAVA_SRC_DIR} ]]; then
			local parent child
			for parent in ${JAVA_SRC_DIR}; do
				for child in ${parent}/*; do
					srcdirs="${srcdirs} ${child}"
				done
			done
		else
			# take all directories actually containing any sources
			srcdirs="$(cut -d/ -f1 ${sources} | sort -u)"
		fi
		java-pkg_dosrc ${srcdirs}
	fi
}

# @FUNCTION: java-pkg-simple_src_test
# @DESCRIPTION:
# src_test for simple single java jar file.
# It will compare natively compiled ${JAVA_JAR_FILENAME}
# with upstream distributed file ${JAVA_BINJAR_FILENAME} if they both exist.
# Then it will perform test with framework defined by ${JAVA_TESTING_FRAMEWORK}.
java-pkg-simple_src_test() {
	local test_sources=test_sources.lst classes=target/testclasses classpath

	# check whether the compiled jar is compliant with binary jar
	if [[ "${JAVA_BINJAR_FILENAME}" ]] && [[ -f "${JAVA_JAR_FILENAME}" ]]; then
		japi-compliance-checker --lib=${PN} \
			"${DISTDIR}"/${JAVA_BINJAR_FILENAME} \
			"${S}"/${JAVA_JAR_FILENAME} \
			|| ewarn "Natively compiled Jar ${JAVA_JAR_FILENAME}" \
			"is not compliant with binary Jar ${JAVA_BINJAR_FILENAME}."
	fi

	if ! has test ${JAVA_PKG_IUSE}; then
		return
	elif ! use test; then
		return
	fi

	# create the directory containing test classes
	mkdir -p ${classes} || die "Could not create target directory for testing"

	# get classpath
	classpath="${classes}:${JAVA_JAR_FILENAME}"
	java-pkg-simple_get-jars
	java-pkg-simple_prepend-resources "${JAVA_TEST_RESOURCE_DIRS[@]}"

	# compile
	find ${JAVA_TEST_SRC_DIR:-*} -name \*.java > ${test_sources}
	ejavac -d ${classes} -encoding ${JAVA_ENCODING} \
		${classpath:+-classpath ${classpath}} ${JAVAC_ARGS} \
		@${test_sources}

	# launch test
	if [[ ${JAVA_TESTING_FRAMEWORK} == "junit" ]]; then
		java-pkg-simple_junit-test
	fi
}
