# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-virtuals-2

DESCRIPTION="Virtual for servlet api"
HOMEPAGE="https://jcp.org/en/jsr/detail?id=340"
SRC_URI=""

LICENSE="public-domain"
SLOT="${PV}"
KEYWORDS="amd64 ~arm64 ppc64 x86"

RDEPEND="|| (
		dev-java/tomcat-servlet-api:4.0
	)"

JAVA_VIRTUAL_PROVIDES="tomcat-servlet-api-4.0"

MAVEN_PROVIDES="javax.el:javax.el-api:3.0.0 javax.el:el-api:3.0.0 org.apache.tomcat:tomcat-servlet-api:9.0.36"
