#!/bin/sh

main() {
  docker build -t rubikscraft/alpine-ghc-aarch64 .
  mkdir -p ./output

  docker run --rm -v "$(pwd)/output:/data" -it rubikscraft/alpine-ghc-aarch64
}

main