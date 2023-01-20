# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-virtuals-2

DESCRIPTION="Virtual for servlet api"
HOMEPAGE="https://jcp.org/en/jsr/detail?id=340"
SRC_URI=""

LICENSE="public-domain"
SLOT="${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"

RDEPEND="|| (
	dev-java/tomcat-jsp-api:2.3
)"

JAVA_VIRTUAL_PROVIDES="tomcat-jsp-api-2.3"

MAVEN_PROVIDES="javax.servlet.jsp:jsp-api:2.3 javax.servlet.jsp:jsp-api:2.3 javax.servlet:jsp-api:2.3 org.apache.tomcat:tomcat-jsp-api:9.0.36"
