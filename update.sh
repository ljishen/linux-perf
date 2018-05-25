#!/usr/bin/env bash
#
# This script file generates Dockerfile for arm64v8 architectures

set -eu -o pipefail

declare -A FOLDER_FROMS
FOLDER_FROMS[debian]=resin/aarch64-debian:stretch
FOLDER_FROMS[debian-python3]=resin/aarch64-python:3.6-slim

for folder in "${!FOLDER_FROMS[@]}"; do
	dockerfile="${folder}"/Dockerfile
	arch_dockerfile="${dockerfile}".arm64v8
	cat > "${arch_dockerfile}" <<- EOH
		#
		# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
		#
		# PLEASE DO NOT EDIT IT DIRECTLY.
		#

	EOH
	cat "${dockerfile}" >> "${arch_dockerfile}"
	sed -i "s|^FROM.*$|FROM ${FOLDER_FROMS[${folder}]}|" "${arch_dockerfile}"
done
