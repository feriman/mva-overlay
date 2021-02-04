# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font git-r3

DESCRIPTION="An icon font providing popular linux distro's logos"
HOMEPAGE="https://lukas-w.github.io/font-linux"
EGIT_REPO_URI="https://github.com/Lukas-W/font-linux"

LICENSE="unlicense"
SLOT="0"

IUSE="webfonts"

src_install() {
	FONT_S="${S}/assets" FONT_SUFFIX="ttf" font_src_install

	use webfonts && (
		insinto /usr/share/webfonts/${PN};
		doins assets/{${PN}-preview.html,preview.png,${PN}.{woff,eot,css,svg}}
	)
}
