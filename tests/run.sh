#!/usr/bin/env bash

ebuild-cmder \
    --portage-config tests/portage-config \
    --custom-repo . \
    --docker-image ghcr.io/leo3418/gentoo-stage3-amd64-java \
    tests/test-cases/kotlin-latest.sh
