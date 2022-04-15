# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit kotlin-libs

KEYWORDS="~amd64"

# This package simulates the :core:builtins:builtinsJar task, which is
# a prerequisite of kotlin-stdlib tasks.  Kotlin compiler needs not be
# called for this package; only the built-ins serializer is invoked.

src_compile() {
	local builtins_cherry_picked="${T}/core/builtins/build/src"
	local cherry_pick_dest="${builtins_cherry_picked}/kotlin/reflect"
	local kotlinc_jar="${KOTLIN_UTILS_COMPILER_HOME}/lib/kotlin-compiler.jar"

	mkdir -p "${KOTLIN_UTILS_CLASSES}" ||
		die "Failed to create target directory"
	mkdir -p "${cherry_pick_dest}" ||
		die "Failed to create temporary directory for cherry-picked built-ins"

	# :core:builtins:prepareSources
	cp libraries/stdlib/src/kotlin/reflect/* "${cherry_pick_dest}" ||
		die "Failed to copy sources for built-ins to temporary directory"
	rm "${cherry_pick_dest}"/{typeOf.kt,KClasses.kt} ||
		die "Failed to remove extraneous sources from cherry-picked built-ins"

	KOTLIN_SRC_DIR=(
		"${builtins_cherry_picked}"
		core/builtins/{src,native}
	)

	# :core:builtins:serialize
	einfo "Serializing built-ins ..."
	# The built-in serializer needs to access XDG_CACHE_HOME, reassign it to
	# avoid access violations caused by 'mkdir /var/lib/portage/home/.cache'
	XDG_CACHE_HOME="${HOME}/.cache" \
	java -classpath "${kotlinc_jar}" \
		org.jetbrains.kotlin.serialization.builtins.RunKt \
		"${KOTLIN_UTILS_CLASSES}" "${KOTLIN_SRC_DIR[@]}" ||
		die "Failed to serialize built-ins"

	# :core:builtins:builtinsJar
	kotlin-utils_jar
}
