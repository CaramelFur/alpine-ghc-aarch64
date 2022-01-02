#!/bin/sh

get_latest_release() {
  api_res=$(curl --silent "https://api.github.com/repos/$1/releases/latest")
  download_urls=$(echo $api_res | jq -r ".assets[].browser_download_url")
  echo "$download_urls"
}

main() {
  urls=$(get_latest_release "rubikscraft/alpine-ghc-aarch64")
  for url in $urls; do
    # if basename contains ghc
    if [[ $(basename $url) =~ ghc ]]; then
      echo "Downloading $url"
      wget $url
    fi
  done
}

main