# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Fight Flash Fraud, or Fight Fake Flash"
HOMEPAGE="http://oss.digirati.com.br/f3/"

EGIT_REPO_URI="https://github.com/AltraMayor/f3"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+extras"

CDEPEND="sys-block/parted
		virtual/udev"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

src_compile() {
	export CFLAGS="${CFLAGS} -fgnu89-inline"
	emake all
	use extras && emake extra
}

src_install() {
	emake install PREFIX="$D/usr/"
	use extras && emake install-extra PREFIX="$D/usr/"
}
