#!/bin/sh
set -e

RELEASE_REPOSITORY="$INPUT_REPOSITORY"
RELEASE_TAG="$INPUT_TAG"
TARGET_PATH="$INPUT_PATH"
ASSET="$INPUT_FILE"
PRIVATE="$INPUT_PRIVATE"

if [ -z "$TARGET_PATH" ]; then
    TARGET_PATH="${GITHUB_WORKSPACE}"
fi

mkdir -p "$TARGET_PATH"
cd "$TARGET_PATH"

if [ "$PRIVATE" == "true" ]; then
    if [ -z "$GITHUB_TOKEN" ]; then
        echo "GITHUB_TOKEN is not set. Quitting."
        exit 1
    fi
    if [ -z "$ASSET" ]; then
        echo "input file undefined. Quitting."
        exit 1
    fi

    /gh-dl-release $GITHUB_TOKEN $RELEASE_REPOSITORY $ASSET $RELEASE_TAG $TARGET_PATH
else
    if [ -n "$ASSET" ]; then
        wget https://github.com/${RELEASE_REPOSITORY}/releases/download/${RELEASE_TAG}/${ASSET}
    else
        wget -O download.tmp https://github.com/${RELEASE_REPOSITORY}/archive/${RELEASE_TAG}.zip
        unzip download.tmp
        rm download.tmp
    fi
fi
