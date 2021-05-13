# Maintainer: Liam Powell <gfelipe099@gmail.com>

pkgname=psensor
pkgver=1.2.1
pkgrel=1
pkgdesc='A graphical hardware temperature monitor for Linux'
arch=('x86_64')
url='https://gitlab.com/jeanfi/psensor'
license=('GPL2')
depends=('lm_sensors' 'dconf' 'gtk3' 'udisks2' 'curl' 'libgtop' 'libnotify' 'libxnvctrl' 'json-c' 'libmicrohttpd' 'git')
makedepends=('git' 'help2man' 'libxnvctrl')
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
