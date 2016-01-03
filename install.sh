#!/usr/bin/env bash

# Install resolveip from github
# Usage: curl -o- https://raw.githubusercontent.com/karlkfi/resolveip/v1.0.1/install.sh | bash
# Requires: make, git

set -o errexit
set -o nounset
set -o pipefail

prefix="/usr/local/bin"

version=${1:-}
if [ -z "${version}" ]; then
  version=$(curl -s https://api.github.com/repos/karlkfi/resolveip/releases/latest | grep 'tag_name' | cut -d\" -f4)
fi

curl -o- "https://raw.githubusercontent.com/karlkfi/resolveip/${version}/resolveip.sh" > "${prefix}/resolveip.sh"
chmod a+x "${prefix}/resolveip.sh"
