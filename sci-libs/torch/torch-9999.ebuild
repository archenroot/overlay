# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Torch is a Lua-based suite for scientific computations based on multidimensional tensors."
HOMEPAGE="https://github.com/torch/torch7"

EGIT_REPO_URI="https://github.com/torch/torch7.git"

inherit git-r3

LICENSE="BSD3"
SLOT="0"
KEYWORDS=""
IUSE=""

inherit cmake-utils

#FIXME: currently hard-code lua 5.1
DEPEND=">=dev-lang/lua-5.1:=
dev-lang/luajit
virtual/blas
virtual/lapack
dev-lua/penlight
dev-lua/lua-cjson
dev-lua/torch-cwrap
dev-lua/torch-paths
sys-devel/gcc[fortran]"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=/usr/lib/lua/5.1"
		"-DLUADIR=/usr/share/lua/5.1"
		"-DLIBDIR=/usr/lib/lua/5.1"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include/luajit-2.0"
		"-DLUA_LIBDIR=/usr/lib"
		"-DLUALIB=/usr/lib/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake-utils_src_configure
}


