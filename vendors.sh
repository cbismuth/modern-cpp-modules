#!/usr/bin/env bash

set -euo pipefail

# Set Google Test dependency path
DIR_VENDORS_GTEST="vendors/google/googletest"

# Clone Google Test repository if not exists
if [[ ! -d  "${DIR_VENDORS_GTEST}" ]]; then
  mkdir -p "${DIR_VENDORS_GTEST}"
  git -c advice.detachedHead=false clone --branch v1.14.0 --depth 1 https://github.com/google/googletest.git "${DIR_VENDORS_GTEST}"
fi
