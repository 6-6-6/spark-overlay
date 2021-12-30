# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-virtuals-2

DESCRIPTION="Virtual for XML RPC API (javax.xml.rpc)"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="dev-java/glassfish-xmlrpc-api:0"

JAVA_VIRTUAL_PROVIDES="glassfish-xmlrpc-api"

MAVEN_PROVIDES="javax.xml.rpc:javax.xml.rpc-api:1.1.1 jakarta.xml.rpc:jakarta.xml.rpc-api:1.1.4"
