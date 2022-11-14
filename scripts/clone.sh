#!/usr/bin/env bash

set -e
set -x

if [[ -n "$MUMBLE_REPO" && ! "$MUMBLE_REPO" == "https://github.com/mumble-voip/mumble/" ]]; then
	git clone --filter=tree:0 "$MUMBLE_REPO" /mumble/repo
else
	git clone --filter=tree:0 https://github.com/mumble-voip/mumble/ /mumble/repo
fi

cd /mumble/repo

git config advice.detachedHead false

if [[ -n "$MUMBLE_VERSION" && ! "$MUMBLE_VERSION" == "latest" ]]; then
	git checkout "$MUMBLE_VERSION"
fi

git submodule update --init
git submodule update --depth 1
