# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-virtuals-2

DESCRIPTION="Virtual for Enterprise JavaBeans API (javax.ejb)"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="dev-java/glassfish-ejb-api:0"

JAVA_VIRTUAL_PROVIDES="glassfish-ejb-api"

MAVEN_PROVIDES="org.glassfish:javax.ejb:3.2 javax.ejb:javax.ejb-api:3.2 jakarta.ejb:jakarta.ejb-api:3.2"
