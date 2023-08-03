#/usr/bin/env bash

set -e

# Clear scroll history
printf "\33c\e[3J"

# Override language support
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Build Docker image
docker build --progress=plain -t modern-cpp-modules/latest .
