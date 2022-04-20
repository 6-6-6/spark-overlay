# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.weld:${PN}:${PV}.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Weld's implementation of CDI"
HOMEPAGE="https://weld.cdi-spec.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Version 1.1.0 uses Guava's MapMaker, which had been removed and replaced by
# CacheLoader.  Although it is possible to migrate from MapMaker to
# CacheLoader, there are multiple uses of MapMaker in 1.1.0 so this would
# require a lot of effort.  The migration was done by the upstream as of
# 1.1.34, the last version in the 1.1.x series, but it is still incompatible
# with classes in the javax.enterprise.inject.spi package in the classpath, as
# some implementations of abstract classes would have some abstract methods
# unimplemented.  In addition, JAPICC reports that 1.1.0 and 1.1.34 are
# incompatible.
#
# The following conditions are required for a source-based build:
# 1. The compilation can get through the CAL10N annotation processor used by
#    this package.  The upstream's resource files do not contain translation
#    for all localization keys, which will cause CAL10N to complain.  On the
#    contrary, some localized strings are not used in the source files, and
#    CAL10N is unhappy about this too.  However, this can be fixed easily by
#    patching the resource files to add dummy translations for missing keys and
#    remove redundant translations.
# 2. Either all source files have been migrated from MapMaker to CacheLoader,
#    or a version of Guava in which MapMaker still exists is used (not
#    recommended, as such Guava version would be too old).
# 3. A JAR for javax.enterprise.inject.spi that is compatible with this package
#    is used for building.
IUSE="+binary"

CP_DEPEND="
	>=dev-java/jboss-ejb-api-1.0.0:3.1_spec
	>=dev-java/jboss-interceptor-core-2.0.0:0
	>=dev-java/jboss-interceptor-spi-2.0.0:0
	>=dev-java/jboss-interceptors-api-1.0.0:1.1_spec
	>=dev-java/jsf-api-2.0:0
	>=dev-java/jta-1.1:0
	>=dev-java/persistence-api-1.0:0
	>=dev-java/weld-api-1.1:0
	>=dev-java/weld-spi-1.1:0
	>=dev-java/cal10n-0.8.1:0
	>=dev-java/cdi-api-1.2:1.2
	>=dev-java/findbugs-annotations-3.0.12:3
	>=dev-java/guava-29.0:0
	>=dev-java/javassist-3.18.2:3
	dev-java/jakarta-annotation-api:0
	>=dev-java/slf4j-api-1.7.7:0
	>=dev-java/slf4j-ext-1.7.5:0
	>=dev-java/validation-api-1.1.0:1.0
	java-virtuals/el-api:3.0
	java-virtuals/jsp-api:2.3
	java-virtuals/servlet-api:4.0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
