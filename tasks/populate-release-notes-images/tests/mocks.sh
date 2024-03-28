#!/usr/bin/env bash
set -eux

# mocks to be injected into task step scripts

function get-image-architectures() {
    echo '{"platform":{"architecture": "amd64", "os": "linux"}, "digest": "abcdefg"}' | base64 -w 0
    echo
    echo '{"platform":{"architecture": "s390x", "os": "linux"}, "digest": "deadbeef"}' | base64 -w 0
    echo
}
