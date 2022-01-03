#!/bin/sh

build_ghc() {
  cd ./aports/community/ghc/

  sed -i 's/x86_64/x86_64 aarch64/g' ./APKBUILD

  abuild -F -r deps fetch verify unpack build rootpkg

  # My files gone, what?
  find ~

  apk add --allow-untrusted /root/packages/community/*/ghc*.apk

  cd ../../../
}

build_cabal_bootstrap() {
  cd ./aports/community/cabal-bootstrap/

  sed -i 's/x86_64/x86_64 aarch64/g' ./APKBUILD

  abuild -F -r
  find ~

  apk add --allow-untrusted /root/packages/community/*/cabal*.apk

  cd ../../../
}

build_cabal() {
  cd ./aports/community/cabal/

  sed -i 's/x86_64/x86_64 aarch64/g' ./APKBUILD

  abuild -F -r

  cd ../../../
}

main() {
  abuild-keygen -a -n

  build_ghc
  mv /root/packages/community/*/*.apk /data

  build_cabal_bootstrap
  mv /root/packages/community/*/*.apk /data

  build_cabal
  mv /root/packages/community/*/*.apk /data

  rm -rf /data/cabal-bootstrap*.apk
}

main
