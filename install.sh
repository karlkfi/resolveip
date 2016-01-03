#!/usr/bin/env bash

# Install resolveip from the internet
# Usage: curl -o- https://raw.githubusercontent.com/karlkfi/resolveip/v1.0.0/install.sh | bash
# Requires: make, git

set -o errexit
set -o nounset
set -o pipefail

version=${1:-}

# Runs the supplied command string in a temporary workspace directory.
#TODO: extract run_in_temp_dir to new repo
function run_in_temp_dir {
  local prefix="$1"
  shift
  local cmd="$@"

  # create temp WORKSPACE dir in current dir to avoid permission issues of TMPDIR on mac os x
  local -r workspace=$(mktemp -d "$(pwd)/${prefix}.XXXXXX")
  echo "Workspace created: ${workspace}" 1>&2

  cleanup() {
    local -r workspace="$1"
    rm -rf "${workspace}"
    echo "Workspace deleted: ${workspace}" 1>&2
  }
  trap "cleanup '${workspace}'" EXIT

  pushd "${workspace}" > /dev/null
  ${cmd}
  popd > /dev/null

  trap - EXIT
  cleanup "${workspace}"
}

function install {
  local version=${1:-}
  git clone https://github.com/karlkfi/resolveip .
  if [ -z "version" ]; then
    version=$(git describe --abbrev=0 --tags)
  fi
  git checkout ${version}
  make install
}

run_in_temp_dir 'resolveip' install ${version}
