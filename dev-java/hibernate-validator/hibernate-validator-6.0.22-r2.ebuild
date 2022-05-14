# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.hibernate.validator:${PN}:${PV}.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PV="${PV}.Final"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Hibernate's Bean Validation (JSR-380) reference implementation"
HOMEPAGE="https://hibernate.org/validator/"
SRC_URI="
	https://repo1.maven.org/maven2/org/hibernate/validator/${PN}/${MY_PV}/${MY_P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/hibernate/validator/${PN}/${MY_PV}/${MY_P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/hibernate-jpa-1.0.2:2.1-api
	>=dev-java/money-api-1.0.1:0
	>=dev-java/paranamer-2.8:0
	>=dev-java/classmate-1.5.1:0
	>=dev-java/jboss-logging-3.4.0:0
	>=dev-java/joda-time-2.9.7:0
	>=dev-java/jsoup-1.8.3:0
	>=dev-java/validation-api-2.0.1:2.0
	dev-java/jaxb-api:2
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		|| (
			dev-java/openjfx:11
			dev-java/openjfx:8
		)
		>=dev-java/javax-el-3.0.1_beta09:0
		>=dev-java/jboss-logging-annotations-2.1.0:0
		>=dev-java/jboss-logging-processor-2.1.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="
	javax-el
	jboss-logging-annotations
	jboss-logging-processor
"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

pkg_setup() {
	java-pkg-2_pkg_setup
	[[ "${MERGE_TYPE}" == binary ]] && return
	use binary && return
	# Set up classpath for JavaFX
	if has_version -d "dev-java/openjfx:11" &&
		ver_test "$(java-config -g PROVIDES_VERSION)" -ge 11; then
		# Use OpenJFX 11 only if the JDK used to build this package supports
		# the version of class files in OpenJFX 11's JARs, which is 54.0
		einfo "Using: openjfx-11"
		JAVA_GENTOO_CLASSPATH_EXTRA="${ESYSROOT}/usr/$(get_libdir)/openjfx-11/lib/javafx.base.jar"
	elif has_version -d "dev-java/openjfx:8"; then
		einfo "Using: openjfx-8"
		# OpenJFX 8 is installed into the home of dev-java/openjdk:8
		local java_home="$(java-config --select-vm=openjdk-8 -O)"
		JAVA_GENTOO_CLASSPATH_EXTRA="${java_home}/jre/lib/ext/jfxrt.jar"
	else
		eerror
		eerror "JDK 8 is being used to build this package, but"
		eerror "dev-java/openjfx:8 could not be found. Please"
		eerror "either switch to a JDK whose version matches"
		eerror "the OpenJFX version installed on the system,"
		eerror "or install dev-java/openjfx:8."
		eerror
		die "Could not find a supported version of OpenJFX"
	fi
}

src_unpack() {
	java-pkg-maven_src_unpack
	use binary && return
	# Extract files from the upstream's pre-built JAR for
	# Bean Validation provider registry file and pkgdiff test
	mkdir binjar ||
		die "Failed to create directory for files unpacked from binary JAR"
	pushd binjar > /dev/null ||
		die "Failed to enter directory for files unpacked from binary JAR"
	unpack "${JAVA_BINJAR_FILENAME}"
	popd > /dev/null ||
		die "Failed to leave directory for files unpacked from binary JAR"
}

src_compile() {
	java-pkg-simple_src_compile
	use binary && return
	pushd binjar > /dev/null ||
		die "Failed to enter directory for files unpacked from binary JAR"
	# Register Bean Validation provider, and add
	# files included in the upstream's pre-built JAR
	jar -uf "${S}/${JAVA_JAR_FILENAME}" \
		META-INF/services/javax.validation.spi.ValidationProvider \
		org/hibernate/validator/internal/util/logging/{Log,Messages}.i18n.properties ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null ||
		die "Failed to leave directory for files unpacked from binary JAR"
}
