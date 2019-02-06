#!/bin/sh
set -e

RELEASE_REPOSITORY=$1
RELEASE_TAG=$2

if [ -z "$TARGET_PATH" ]; then
    TARGET_PATH="${GITHUB_WORKSPACE}"
fi

mkdir -p $TARGET_PATH
cd $TARGET_PATH
wget -O release.zip https://github.com/${RELEASE_REPOSITORY}/archive/${RELEASE_TAG}.zip
unzip release.zip
rm release.zip
