# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: java-pkg-simple-plugins.eclass
# @MAINTAINER:
# zongyu
# @AUTHOR:
# zongyu
# @BLURB: 
# @DESCRIPTION:

#KOTLINC_ARGS
#SCALAC_ARGS

escalac() {
	debug-print-function ${FUNCNAME} $*

	local compiler_executable
	compiler_executable="scalac-2.12"

	#local scalac_args
	#scalac_args="$(java-pkg_javac-args)"

	if [[ -n ${JAVA_PKG_DEBUG} ]]; then
		einfo "Verbose logging for \"${FUNCNAME}\" function"
		einfo "Compiler executable: ${compiler_executable}"
		einfo "Extra arguments: ${scalac_args}"
		einfo "Complete command:"
		einfo "${compiler_executable} ${scalac_args} ${@}"
	fi

	einfo "Compiling ..."
	${compiler_executable} ${scalac_args} "${@}" || die "escala failed"
}

ekotlinc() {
	debug-print-function ${FUNCNAME} $*

	local compiler_executable
	compiler_executable="kotlinc"

	#local kotlinc_args
	#kotlinc_args="$(java-pkg_javac-args)"

	if [[ -n ${JAVA_PKG_DEBUG} ]]; then
		einfo "Verbose logging for \"${FUNCNAME}\" function"
		einfo "Compiler executable: ${compiler_executable}"
		einfo "Extra arguments: ${kotlinc_args}"
		einfo "Complete command:"
		einfo "${compiler_executable} ${kotlinc_args} ${@}"
	fi

	einfo "Compiling ..."
	${compiler_executable} ${kotlinc_args} "${@}" || die "ekotlinc failed"
}

java-pkg-simple-plugins_src_compile() {
	local classes=target/classes
	local java_sources=java_sources.lst
	local scala_sources=scala_sources.lst
	local kotlin_sources=kotlin_sources.lst

	# do not compile if we decide to install binary jar
	if has binary ${JAVA_PKG_IUSE} && use binary; then
		# register the runtime dependencies
		for dependency in ${JAVA_GENTOO_CLASSPATH//,/ }; do
			java-pkg_record-jar_ ${dependency}
		done

		cp ${DISTDIR}/${JAVA_BINJAR_FILENAME} ${JAVA_JAR_FILENAME}\
			|| die "Could not copy the binary jar file to ${S}"
		return 0
	fi

	# gather sources
	echo -n > ${java_sources}\
		|| die "Could not create an empty ${java_sources}"
	echo -n > ${scala_sources}\
		|| die "Could not create an empty ${scala_sources}"
	echo -n > ${kotlin_sources}\
		|| die "Could not create an empty ${kotlin_sources}"
	local directory
	find "${JAVA_SRC_DIR[@]}" -name \*.java >> ${java_sources}
	find "${JAVA_SRC_DIR[@]}" -name \*.scala >> ${scala_sources}
	find "${JAVA_SRC_DIR[@]}" -name \*.kt >> ${kotlin_sources}

	# create the target directory
	mkdir -p ${classes} || die "Could not create target directory"

	# compile
	local classpath=""
	java-pkg-simple_getclasspath
	java-pkg-simple_prepend_resources "${JAVA_RESOURCE_DIRS[@]}"
	classpath+=":${classes}"

	[[ -s ${java_sources} ]] && ejavac -d ${classes} -encoding ${JAVA_ENCODING}\
		${classpath:+-classpath ${classpath}} ${JAVAC_ARGS}\
		@${java_sources}

	[[ -s ${scala_sources} ]] && escalac -d ${classes} -encoding ${JAVA_ENCODING}\
		${classpath:+-classpath ${classpath}} ${SCALAC_ARGS}\
		@${scala_sources}

	[[ -s ${kotlin_sources} ]] && ekotlinc -d ${classes}\
		${classpath:+-classpath ${classpath}} ${KOTLINC_ARGS}\
		@${kotlin_sources}

	local jar_args
	if [[ -e ${classes}/META-INF/MANIFEST.MF ]]; then
		jar_args="cfm ${JAVA_JAR_FILENAME} ${classes}/META-INF/MANIFEST.MF"
	elif [[ ${JAVA_MAIN_CLASS} ]]; then
		jar_args="cfe ${JAVA_JAR_FILENAME} ${JAVA_MAIN_CLASS}"
	elif [[ -f ${JAVA_JAR_FILENAME} ]]; then
		jar_args="uf ${JAVA_JAR_FILENAME}"
	else
		jar_args="cf ${JAVA_JAR_FILENAME}"
	fi
	jar ${jar_args} -C ${classes} . || die "jar failed"
}
