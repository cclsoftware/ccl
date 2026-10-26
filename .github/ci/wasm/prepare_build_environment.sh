#!/usr/bin/env bash
set -euo pipefail

echo "CMAKE_PRESET=wasm-release" >> "$GITHUB_ENV"
echo "CCACHE_DIR=${GITHUB_WORKSPACE}/.ccache" >> "$GITHUB_ENV"

# GitHub overrides the container entrypoint, so the Emscripten environment has to be exported for subsequent steps
source /emsdk/emsdk_env.sh

echo "EMSDK=${EMSDK}" >> "$GITHUB_ENV"
echo "EMSDK_NODE=${EMSDK_NODE}" >> "$GITHUB_ENV"
echo "${EMSDK}" >> "$GITHUB_PATH"
echo "${EMSDK}/upstream/emscripten" >> "$GITHUB_PATH"
echo "$(dirname "${EMSDK_NODE}")" >> "$GITHUB_PATH"
