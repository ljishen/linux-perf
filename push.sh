#!/usr/bin/env bash
#
# Execute this script after the building by Travis CI successfully completed.
#
# We might integrate this process to .travis.yml after the `docker manifest`
# command graduated from experimentation.

set -eu -o pipefail

IMAGE_NAME=ljishen/perf
TAGS=(latest 4.9 4.9-python3)

for tag in "${TAGS[@]}"; do
    docker manifest create "${IMAGE_NAME}":"${tag}" "${IMAGE_NAME}":amd64-"${tag}" "${IMAGE_NAME}":arm64v8-"${tag}"
    docker manifest annotate "${IMAGE_NAME}":"${tag}" "${IMAGE_NAME}":amd64-"${tag}" --os linux --arch amd64
    docker manifest annotate "${IMAGE_NAME}":"${tag}" "${IMAGE_NAME}":arm64v8-"${tag}" --os linux --arch arm64 --variant v8
done
