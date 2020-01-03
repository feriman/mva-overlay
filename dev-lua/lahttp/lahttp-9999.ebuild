# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VCS="mercurial"
inherit lua

DESCRIPTION="Lua Asynchronous HTTP Library."
HOMEPAGE="http://code.matthewwild.co.uk/"
EHG_REPO_URI="http://code.matthewwild.co.uk/${PN}/"

LICENSE="MIT"
SLOT="0"
RESTRICT="network-sandbox"

RDEPEND="
	dev-lua/squish
	dev-lua/luasocket
"
DEPEND="${RDEPEND}"

all_lua_prepare() {
#		-e "s#net/httpclient#libs/httpclient#" \ #why it there?
	sed -r \
		-e 's#(AutoFetchURL ").*/prosody.im.*(/\?")#\1https://hg.prosody.im/0.8/raw-file/278489ee6e34\2#' \
		-i squishy
}

each_lua_compile() {
	squish --use-http || die
}

each_lua_install() {
	dolua lahttp.lua
}
