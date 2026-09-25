#!/usr/bin/env bash
set -euo pipefail

export CMAKE_BUILD_OPTIONS="${CMAKE_BUILD_OPTIONS:-} -DVENDOR_ENABLE_CODESIGNING=ON"
export CPACK_OPTIONS="${CPACK_OPTIONS:-} -G NSIS64"

export CMAKE_PRESET="${CMAKE_PRESET:-win64}"

if [ ! -z ${ccl_SIGNING_AZURE_CLIENTID_WIN:-} ]; then
	az login --service-principal --username ${ccl_SIGNING_AZURE_CLIENTID_WIN} --password ${ccl_SIGNING_AZURE_SECRET} --tenant ${ccl_SIGNING_AZURE_TENANTID_WIN}
fi
