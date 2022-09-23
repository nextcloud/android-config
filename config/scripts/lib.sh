#!/usr/bin/env bash
## This file is intended to be sourced by other scripts

## if DEBUG is present in the env, will enable echoing every command
if [ -n "${DEBUG:-}" ]; then
    set -x
    echo "DEBUG enabled"
fi

## echoes to stderr
function err() {
    echo >&2 "$@"
}

## makes an authenticated request to the Github API using the GITHUB_TOKEN from the environment
function curl_gh() {
    if [[ -n "${GITHUB_TOKEN:-}" ]]; then
        curl \
            --silent \
            --header "Authorization: token $GITHUB_TOKEN" \
            "$@"
    else
        err "WARNING: No GITHUB_TOKEN found. Skipping API call"
    fi

}
