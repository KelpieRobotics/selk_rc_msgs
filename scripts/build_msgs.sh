#!/usr/bin/env bash

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# Remove old build dir
if [ -d "${REPO_DIR}/build" ]; then
    rm -rf "${REPO_DIR}/build"
fi

# Create build dir
mkdir -p ${REPO_DIR}/build/cpp \
    ${REPO_DIR}/build/python

# Build
protoc -I=${REPO_DIR}/proto \
    --cpp_out=${REPO_DIR}/build/cpp \
    --python_out=${REPO_DIR}/build/python \
    ${REPO_DIR}/proto/rc_channels.proto
