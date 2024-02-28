# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Portable Famicom/NES emulator, an evolution of the original FCE Ultra"
HOMEPAGE="https://fceux.com/"
EGIT_REPO_URI="https://github.com/TASEmulators/fceux.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86 arm64"
REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="
	${LUA_DEPS}
	media-libs/libglvnd
	media-libs/libsdl2[joystick,sound,threads,video]
	sys-libs/zlib:=[minizip]
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtopengl:5[-gles2-only]
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}"

src_configure() {
	cmake .
}

src_compile() {
	make 
}

src_install() {
	default
}
