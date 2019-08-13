#!/bin/sh

source ./config
extra_config="config.extra"

IMG_VERSION="$(git describe --tags)"

rm -f "${extra_config}"
echo "IMG_VERSION=${IMG_VERSION}" >> "${extra_config}"
echo "IMG_FILENAME=${IMG_NAME}-${IMG_VERSION}" >> "${extra_config}"
echo "ZIP_FILENAME=${IMG_NAME}-${IMG_VERSION}" >> "${extra_config}"

cat config.base "${extra_config}" > config

./build-docker.sh 2>&1 | tee build.log
