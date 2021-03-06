################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="parted"
PKG_VERSION="3.2"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.gnu.org/software/parted/"
PKG_URL="http://ftpmirror.gnu.org/parted/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="toolchain util-linux:host"
PKG_DEPENDS_TARGET="toolchain util-linux parted:host readline netbsd-curses"
PKG_DEPENDS_INIT="toolchain util-linux:init parted"
PKG_SECTION="system"
PKG_SHORTDESC="parted: GNU partition editor"
PKG_LONGDESC="GNU Parted is a program for creating, destroying, resizing, checking and copying partitions, and the file systems on them. This is useful for creating space for new operating systems, reorganising disk usage, copying data between hard disks and disk imaging."
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--disable-device-mapper \
                           --disable-shared \
                           --disable-rpath \
                           --with-gnu-ld"

PKG_CONFIGURE_OPTS_HOST="$PKG_CONFIGURE_OPTS_TARGET"

configure_init() {
  : # reuse configure_target()
}

make_init() {
  : # reuse make_target()
}

makeinstall_init() {
  mkdir -p $INSTALL/usr/sbin
  mkdir -p $INSTALL/usr/lib
    cp ../.$TARGET_NAME/parted/parted $INSTALL/usr/sbin
    cp ../.$TARGET_NAME/partprobe/partprobe $INSTALL/usr/sbin
    cp $(get_build_dir readline)/.install_pkg/usr/lib/libreadline.so.? $INSTALL/usr/lib
    cp $(get_build_dir netbsd-curses)/.install_pkg/usr/lib/libterminfo.so $INSTALL/usr/lib
}
