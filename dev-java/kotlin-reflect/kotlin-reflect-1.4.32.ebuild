# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"

KOTLIN_CORE_DEPS_MODULE_NAME="kotlin-reflection"
KOTLIN_LIBS_RUNTIME_COMPONENT="Main"

inherit kotlin-core-deps

DESCRIPTION="Kotlin Full Reflection Library"
KEYWORDS="~amd64"

# JAR built by this ebuild contains extra directories:
# - kotlin/reflect/jvm/internal/impl/container
RESTRICT="test"

BDEPEND="
	!binary? (
		app-arch/unzip
	)
"
CP_DEPEND="
	~dev-java/kotlin-stdlib-${PV}:${SLOT}
"
DEPEND="
	!binary? (
		${CP_DEPEND}
		~dev-java/kotlin-annotations-jvm-${PV}:${SLOT}
		~dev-java/kotlin-core-compiler-common-${PV}:${SLOT}
		~dev-java/kotlin-core-compiler-common-jvm-${PV}:${SLOT}
		~dev-java/kotlin-core-descriptors-${PV}:${SLOT}
		~dev-java/kotlin-core-descriptors-jvm-${PV}:${SLOT}
		~dev-java/kotlin-core-descriptors-runtime-${PV}:${SLOT}
		~dev-java/kotlin-core-deserialization-${PV}:${SLOT}
		~dev-java/kotlin-core-deserialization-common-${PV}:${SLOT}
		~dev-java/kotlin-core-deserialization-common-jvm-${PV}:${SLOT}
		~dev-java/kotlin-core-metadata-${PV}:${SLOT}
		~dev-java/kotlin-core-metadata-jvm-${PV}:${SLOT}
		~dev-java/kotlin-core-util-runtime-${PV}:${SLOT}
		dev-java/javax-inject:0
		dev-java/jetbrains-annotations:13
		>=dev-java/kotlin-protobuf-lite-2.6.1:0
	)
"
RDEPEND="${CP_DEPEND}"

JAVA_CLASSPATH_EXTRA="
	kotlin-annotations-jvm-${SLOT}
	javax-inject
	jetbrains-annotations-13
	kotlin-protobuf-lite
	kotlin-core-compiler-common-${SLOT}
	kotlin-core-compiler-common-jvm-${SLOT}
	kotlin-core-descriptors-${SLOT}
	kotlin-core-descriptors-jvm-${SLOT}
	kotlin-core-descriptors-runtime-${SLOT}
	kotlin-core-deserialization-${SLOT}
	kotlin-core-deserialization-common-${SLOT}
	kotlin-core-deserialization-common-jvm-${SLOT}
	kotlin-core-metadata-${SLOT}
	kotlin-core-metadata-jvm-${SLOT}
	kotlin-core-util-runtime-${SLOT}
"
JAVA_BINJAR_FILENAME="${P}.jar"
KOTLIN_LIBS_SRCJAR_FILENAME="${P}-sources.jar"
JAVA_RESOURCE_DIRS=( core/reflection.jvm/resources )

KOTLIN_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-kotlin-package
	-Xallow-no-source-files
	-Xjvm-default=compatibility
	-Xno-kotlin-nothing-value-exception
	-Xno-optimized-callable-references
	-Xnormalize-constructor-calls=enable
	-Xopt-in=kotlin.RequiresOptIn
)
KOTLIN_JAVA_SOURCE_ROOTS=( core/reflection.jvm/src )
KOTLIN_SRC_DIR=( core/reflection.jvm/src )

src_unpack() {
	kotlin-libs_src_unpack
	if ! has binary ${JAVA_PKG_IUSE} || ! use binary; then
		# Unpack JARs whose contents should be bundled within this package
		unpack "$(java-pkg_getjar --build-only \
			kotlin-protobuf-lite "kotlin-protobuf-lite.jar")"
		local pkgs_to_unpack=(
			kotlin-core-compiler-common
			kotlin-core-compiler-common-jvm
			kotlin-core-descriptors
			kotlin-core-descriptors-jvm
			kotlin-core-descriptors-runtime
			kotlin-core-deserialization
			kotlin-core-deserialization-common
			kotlin-core-deserialization-common-jvm
			kotlin-core-metadata
			kotlin-core-metadata-jvm
			kotlin-core-util-runtime
		)
		for pkg in "${pkgs_to_unpack[@]}"; do
			unpack "$(java-pkg_getjar --build-only \
				"${pkg}-${SLOT}" "${pkg}.jar")"
		done

		# Directories not in the binary JAR from the upstream
		local rm_dirs=(
			kotlin/reflect/jvm/internal/impl/contracts
			kotlin/reflect/jvm/internal/impl/descriptors/synthetic
			kotlin/reflect/jvm/internal/impl/metadata/jvm/serialization
			kotlin/reflect/jvm/internal/impl/metadata/serialization
			kotlin/reflect/jvm/internal/impl/resolve/scopes/synthetic
			kotlin/reflect/jvm/internal/impl/types/refinement
			kotlin/reflect/jvm/internal/impl/utils/addToStdlib
		)
		rm -r "${rm_dirs[@]}" || die "Failed to remove extraneous classes"

		mkdir -p "${S}/${KOTLIN_UTILS_CLASSES}" || \
			die "Failed to create target directory for compiler output"
		mv kotlin META-INF "${S}/${KOTLIN_UTILS_CLASSES}" || \
			die "Failed to move core components to target directory"
	fi
}
