#!/bin/sh
set -e

RELEASE_REPOSITORY="$INPUT_REPOSITORY"
RELEASE_TAG="$INPUT_TAG"
TARGET_PATH="$INPUT_PATH"
ASSET="$INPUT_FILE"
TOKEN="$INPUT_TOKEN"

if [ -z "$TARGET_PATH" ]; then
    TARGET_PATH="${GITHUB_WORKSPACE}"
fi

mkdir -p "$TARGET_PATH"
cd "$TARGET_PATH"

if [ -n "$ASSET" ]; then
    /gh-dl-release "$RELEASE_REPOSITORY" "$RELEASE_TAG" "$ASSET" $TOKEN
else
    wget -O download.tmp https://github.com/${RELEASE_REPOSITORY}/archive/${RELEASE_TAG}.zip
    unzip download.tmp
    rm download.tmp
fi

