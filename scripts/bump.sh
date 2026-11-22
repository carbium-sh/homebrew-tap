#!/usr/bin/env bash
# Points Formula/carbium.rb at the carbium CLI release cli-v<version>: the version line, each download URL, and each
# sha256 taken from that release's SHA256SUMS. Refuses a file the formula names that SHA256SUMS does not list.
# Usage: scripts/bump.sh <version>   (for example 0.1.1)
set -euo pipefail

v="${1:-}"
if [[ ! "${v}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
then
  echo "bump: not a version: '${v}'" >&2
  exit 2
fi
dir="$(dirname "${0}")"
f="${dir}/../Formula/carbium.rb"
sums="$(mktemp)"
trap 'rm -f "${sums}" "${f}.new"' EXIT
curl -fsSL --proto '=https' -o "${sums}" "https://github.com/carbium-sh/carbium-js/releases/download/cli-v${v}/SHA256SUMS"
awk -v v="${v}" -f "${dir}/bump.awk" "${sums}" "${f}" >"${f}.new"
mv "${f}.new" "${f}"
echo "bump: Formula/carbium.rb now points at cli-v${v}"
