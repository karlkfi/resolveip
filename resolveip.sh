#!/usr/bin/env bash

# Resolve an IP from a hostname (using getent or dscacheutil)
# Usage: resolveip.sh <hostname>
# Requires: getent (linux) or dscacheutil (mac)

set -o errexit
set -o nounset
set -o pipefail

hostname="${1:-}"
[ -z "${hostname}" ] && echo "No hostname supplied" >&2 && exit 1

if hash getent 2>/dev/null; then
  getent hosts "${hostname}" | cut -d' ' -f1 | sort -u | tail -1
elif hash dscacheutil 2>/dev/null; then
  dscacheutil -q host -a name "${hostname}" | grep 'ip_address' | cut -d' ' -f2
else
  echo "Required utilities not found: getent or dscacheutil" >&2 && exit 1
fi

