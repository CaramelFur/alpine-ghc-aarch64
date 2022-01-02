#!/bin/sh

build_ghc() {
  cd ./aports/community/ghc/

  sed -i 's/x86_64/x86_64 aarch64/g' ./APKBUILD

  abuild -F -r deps fetch verify unpack build rootpkg

  apk add --allow-untrusted /root/packages/**/ghc*.apk

  cd ../../../
}

build_cabal_bootstrap() {
  cd ./aports/community/cabal-bootstrap/

  sed -i 's/x86_64/x86_64 aarch64/g' ./APKBUILD

  abuild -F -r deps fetch verify unpack build rootpkg

  apk add --allow-untrusted /root/packages/**/cabal*.apk

  cd ../../../
}

build_cabal() {
  cd ./aports/community/cabal/

  sed -i 's/x86_64/x86_64 aarch64/g' ./APKBUILD

  abuild -F -r deps fetch verify unpack build rootpkg

  cd ../../../
}

main() {
  abuild-keygen -a -n

  build_ghc
  build_cabal_bootstrap
  build_cabal

  mv /root/packages/**/*.apk /data
}

main