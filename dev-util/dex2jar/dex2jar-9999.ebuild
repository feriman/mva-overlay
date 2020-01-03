# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Tools to work with android .dex and java .class files"
HOMEPAGE="https://github.com/pxb1988/dex2jar"
EGIT_REPO_URI="https://github.com/pxb1988/${PN}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="virtual/gradle"
RDEPEND="
	dev-java/antlr:3.5
	|| ( virtual/jre virtual/jdk )
"
#	dev-util/android-sdk-update-manager

#pkg_setup() {
#
#}

src_prepare() {
	default
	sed -r \
		-e '/com.google.android.tools:dx:23.0.0/d' \
		-i dex-tools/build.gradle
	# TODO:
	# 1) try to use dx.jar from android-sdk-update-manager's downloaded android tools
	# 2) migrate to some fork with fixed issues
}

src_compile() {
	TERM=dumb gradle --console=rich assemble
}

src_install() {
	local dir="/usr/share/${P}"

	exeinto "${dir}"
	doexe dex-tools/build/generated-sources/bin/*.sh

	rm */build/libs/*-sources.jar
	insinto "${dir}/lib"
	doins */build/libs/*.jar

	dosym "${dir}/d2j-${PN}.sh" "/usr/bin/${PN}"
}
