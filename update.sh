#!/usr/bin/env bash
#
# This script file generates Dockerfile for different architectures

set -eu -o pipefail

SOURCE_FOLDERS=(debian-python3 debian)
ARCHS=(amd64 arm64v8)

for folder in "${SOURCE_FOLDERS[@]}"; do
    dockerfile="${folder}"/Dockerfile

    for arch in "${ARCHS[@]}"; do
        arch_dockerfile="${dockerfile}"-"${arch}"
        cat > "${arch_dockerfile}" <<- EOH
			#
			# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
			#
			# PLEASE DO NOT EDIT IT DIRECTLY.
			#

EOH
        cat "${dockerfile}" >> "${arch_dockerfile}"
        sed -i "s/FROM *\\([[:alnum:]]*\\):/FROM ${arch}\\/\\1:/" "$arch_dockerfile"
    done
done
