# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VCS="git"
LUA_COMPAT="luajit2"
GITHUB_A="jcupitt"

inherit lua-broken

DESCRIPTION="fast, low-memory-use image processing for luajit"
HOMEPAGE="https://github.com/jcupitt/lua-vips"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	>media-libs/vips-8.0.0
"
DEPEND="
	${RDEPEND}
"

DOCS=(README.md)

src_compile() { :; }

each_lua_install() {
	dolua_jit src/*
}
