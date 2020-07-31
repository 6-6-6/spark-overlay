# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit java-virtuals-2

DESCRIPTION="Virtual for servlet api"
HOMEPAGE="https://jcp.org/en/jsr/detail?id=340"
SRC_URI=""

LICENSE="public-domain"
SLOT="${PV}"
KEYWORDS="amd64 ~arm64 ppc64 x86"

RDEPEND="|| (
		dev-java/tomcat-servlet-api:${SLOT}
	)"

JAVA_VIRTUAL_PROVIDES="tomcat-servlet-api-${SLOT}"

MAVEN_PROVIDES="javax.servlet:javax.servlet-api:4.0.1 javax.servlet:servlet-api:4.0.1 org.glassfish:javax.servlet:10.0-b28 org.apache.tomcat:tomcat-servlet-api:9.0.36"
