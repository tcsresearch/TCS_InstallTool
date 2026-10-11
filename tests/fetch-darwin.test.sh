#!/usr/bin/env bash
set -eo pipefail
root=$(cd "$(dirname "$0")/.." && pwd)

downloader_app=wget
downloader_args=" -c"
set +e
"$downloader_app $downloader_args" -O /tmp/tcs-out.zip "https://www.python.org/robots.txt" >/tmp/tcs-wget.out 2>/tmp/tcs-wget.err
red=$?
set -e
if [ "$red" -eq 0 ]; then
  echo "glued wget unexpectedly succeeded" >&2
  exit 1
fi
grep -q "wget  -c" /tmp/tcs-wget.err
grep -q "command not found" /tmp/tcs-wget.err

# shellcheck disable=SC1091
source "$root/functions/TCS_InstallTool.bfunc"
if grep -q 'downloader_app $downloader_args' "$root/functions/TCS_InstallTool.bfunc"; then
  echo "ManualDownloader still glues the downloader into one word" >&2
  exit 1
fi

tmp=$(mktemp -d)
cd "$tmp"
fetch_url robots.txt "https://www.python.org/robots.txt"
test -s robots.txt
grep -q "User-agent" robots.txt
echo "TCS_InstallTool darwin ok (glued wget exit $red, curl saved robots.txt)"
