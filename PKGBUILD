# Maintainer: Liam Powell <gfelipe099@gmail.com>

pkgname=psensor
pkgver=1.2.1
pkgrel=1
pkgdesc='A graphical hardware temperature monitor for Linux'
arch=('x86_64')
url='https://gitlab.com/jeanfi/psensor'
license=('GPL2')
depends=('lm_sensors' 'dconf' 'gtk3' 'udisks2' 'curl' 'libgtop' 'libnotify' 'libxnvctrl' 'json-c' 'libmicrohttpd')
makedepends=('gcc' 'help2man')
conflicts=("${pkgname%-git}")
source=("https://wpitchoune.net/psensor/files/psensor-${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  echo "Applying commit #4088dc47: fix compilation error with microhttpd >= 0.9.71"
  curl -sL https://gitlab.com/jeanfi/psensor/-/raw/master/src/server/server.c > src/server/server.c
  autoreconf -i
  ./configure
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
