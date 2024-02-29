# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A video player that has keybindings similar to Mplayer. No X or wayland required."
HOMEPAGE="https://wiki.adrenlinerush.net/"
EGIT_REPO_URI="https://github.com/adrenlinerush/qeglfsvideoplayer.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 arm64"

IUSE="linuxfb eglfs X"
REQUIRED_USE="|| ( linuxfb eglfs X )"

RDEPEND="
	linuxfb? ( >=dev-qt/qtgui-5.15.8-r3[evdev,jpeg,linuxfb,png,udev,-libinput] )
	eglfs? ( >=dev-qt/qtgui-5.15.8-r3[egl,eglfs,evdev,jpeg,png,udev,-libinput] )
	X? ( >=dev-qt/qtgui-5.15.8-r3[X,evdev,jpeg,png,udev,-libinput] )
	>=dev-qt/qtmultimedia-5.15.8[widgets,gstreamer]
	>=dev-qt/qtwebchannel-5.15.8[qml]
	>=dev-qt/qtwebengine-5.15.8[widgets,-bindist]
	>=dev-qt/qtcore-5.15.8-r3[icu]
	>=dev-qt/qtprintsupport-5.15.8[cups]
	>=media-plugins/gst-plugins-meta-1.20.4
	>=media-fonts/terminus-font-4.49.1
	>=media-libs/gst-plugins-bad-1.22.3-r3
	>=media-libs/gst-plugins-base-1.22.3
	>=media-libs/gst-plugins-good-1.20.6
	>=media-libs/gst-plugins-ugly-1.22.3
	>=media-libs/gstreamer-1.22.3
"
DEPEND="${RDEPEND}"

src_configure() {
	qmake5 qeglfsvideoplayer.pro
}

src_compile() {
	make 
}

src_install() {
	dobin qeglfsvideoplayer
}
