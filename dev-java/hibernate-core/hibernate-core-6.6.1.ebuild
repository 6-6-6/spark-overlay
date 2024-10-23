# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_PROVIDES="
	org.hibernate:hibernate-core:${PV}.Final
	org.hibernate:hibernate-entitymanager:${PV}.Final
"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The core O/RM functionality as provided by Hibernate"
HOMEPAGE="https://hibernate.org"
SRC_URI="
	https://repo1.maven.org/maven2/org/hibernate/orm/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/hibernate/orm/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar
"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	=dev-java/jakarta-persistence-api-3.1.0:0
	>=dev-java/byte-buddy-1.14.18:0
	>=dev-java/classmate-1.5.1:0
	>=dev-java/hibernate-commons-annotations-7.0.1:0
	>=dev-java/jakarta-validation-api-3.0.2:0
	>=dev-java/jandex-3.0.0:0
	dev-java/antlr:4
	dev-java/cdi-api:0
	dev-java/checker-framework-qual:0
	dev-java/jakarta-annotations-api:0
	dev-java/jakarta-inject-api:0
	dev-java/jakarta-json-bind-api:0
	dev-java/jakarta-transaction-api:0
	dev-java/jakarta-xml-bind-api:0
	dev-java/jdbc-postgresql:0
	dev-java/ojdbc-bin:0[binary]
	dev-java/validation-api:2.0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-11:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-11:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	java-pkg-maven_src_unpack
	use binary && return

	# Extract files from the upstream's pre-built JAR for pkgdiff test
	mkdir binjar ||
		die "Failed to create directory for files unpacked from binary JAR"
	pushd binjar > /dev/null ||
		die "Failed to enter directory for files unpacked from binary JAR"
	unpack "${JAVA_BINJAR_FILENAME}"
	popd > /dev/null ||
		die "Failed to leave directory for files unpacked from binary JAR"
}

src_prepare() {
	# https://bugs.gentoo.org/940761
	eapply "${FILESDIR}"/${P}-bytebuddy.patch

	default
}

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" \
		$(find org/hibernate -name "*.dtd") \
		$(find org/hibernate -name "*.xsd") ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
	pushd binjar > /dev/null ||
		die "Failed to enter directory for files unpacked from binary JAR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" \
		$(find org/hibernate -name "*.properties") ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null ||
		die "Failed to leave directory for files unpacked from binary JAR"
}
