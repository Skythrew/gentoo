# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp readme.gentoo-r1

DESCRIPTION="Install color themes (includes many themes)"
HOMEPAGE="http://www.nongnu.org/color-theme/"
SRC_URI="http://download.savannah.gnu.org/releases-noredirect/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux"

PATCHES=(
	"${FILESDIR}"/${P}-replace-in-string.patch
	"${FILESDIR}"/${P}-emacs-26.patch
	"${FILESDIR}"/${P}-emacs-29.patch
)
ELISP_REMOVE="color-theme-autoloads.*"
SITEFILE="50${PN}-gentoo-6.6.0-r3.el"

src_install() {
	elisp-install ${PN} *.el *.elc
	elisp-install ${PN}/themes themes/*.el
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	dodoc AUTHORS BUGS ChangeLog README

	local DOC_CONTENTS="To use color-theme non-interactively, initialise it
		in your ~/.emacs file as in the following example (which is
		for the \"Blue Sea\" theme):
		\n
		\n(color-theme-initialize)
		\n(color-theme-blue-sea)"
	readme.gentoo_create_doc
}
