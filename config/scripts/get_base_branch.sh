#!/usr/bin/env bash
# gets the "base branch" against which to compare analysis results;
# this would be the base branch for PRs and the head branch for pushes
set -euo pipefail

PR_NUMBER="${1:-}"

#shellcheck source=lib.sh
source "$(dirname "$0")/lib.sh"

if [ -z "${PR_NUMBER}" ]; then
    git branch --show-current
else
    curl_gh "https://api.github.com/repos/${GITHUB_REPOSITORY}/pulls/${PR_NUMBER}" | jq .base.ref
fi
