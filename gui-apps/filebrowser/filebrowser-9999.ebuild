# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Filebrowser from adrenlinerushui for use with X"
HOMEPAGE="https://wiki.adrenlinerush.net/"
EGIT_REPO_URI="https://github.com/adrenlinerush/filebrowser.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 arm64"


RDEPEND="
	>=dev-qt/qtgui-5.15.8-r3[X,evdev,jpeg,png,udev,-libinput]
	>=dev-qt/qtmultimedia-5.15.8[widgets,gstreamer]
	>=dev-qt/qtwebchannel-5.15.8[qml]
	>=dev-qt/qtwebengine-5.15.8[widgets,-bindist]
	>=dev-qt/qtcore-5.15.8-r3[icu]
	>=dev-qt/qtprintsupport-5.15.8[cups]
	>=dev-qt/qtwidgets-5.15.8
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
	qmake5 filebrowser.pro
}

src_compile() {
	make 
}

src_install() {
	dobin filebrowser
	dodir /usr/share/filebrowser
	insinto /usr/share/filebrowser
	doins -r markdown
	doins adrenaline.png 
}
