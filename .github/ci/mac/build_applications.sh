#!/usr/bin/env bash
set -euo pipefail

: "${APPLE_API_KEY_FILENAME:?}"
export APPLE_API_KEYPATH="$HOME/$APPLE_API_KEY_FILENAME"
[[ -f "${APPLE_API_KEYPATH}" ]] ||
{
  echo "APPLE_API_KEYPATH does not exist: $APPLE_API_KEYPATH" >&2
  exit 2
}

: "${APPLE_API_KEYID:?}"
export APPLE_API_KEYID

: "${APPLE_API_ISSUER:?}"
export APPLE_API_ISSUER


pushd development/cmake
cmake --preset mac ${CMAKE_BUILD_OPTIONS}
cmake --build build --config Release -- -allowProvisioningUpdates -authenticationKeyPath "$APPLE_API_KEYPATH" -authenticationKeyID "$APPLE_API_KEYID"  -authenticationKeyIssuerID "$APPLE_API_ISSUER"
popd

development/packaging/mac/build_applications.sh
