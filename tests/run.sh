#!/usr/bin/env bash

main() {
    for script in "$@"; do
        unset PORTAGE_CONFIG DOCKER_IMAGE PROFILE GENTOO_REPO THREADS
        unset EMERGE_OPTS PULL STORAGE_OPTS CUSTOM_REPOS

        . "${script}"

        args=(
            ebuild-cmder
            --portage-config "${PORTAGE_CONFIG:-tests/portage-config/default}"
            --docker-image "${DOCKER_IMAGE:-ghcr.io/leo3418/gentoo-stage3-amd64-java}"
            ${PROFILE:+--profile ${PROFILE}}
            ${GENTOO_REPO:+--gentoo-repo ${GENTOO_REPO}}
            ${THREADS:+--threads ${THREADS}}
            ${EMERGE_OPTS:+--emerge-opts ${EMERGE_OPTS}}
            ${PULL:+--pull}
            ${STORAGE_OPTS:+--storage-opts ${STORAGE_OPTS}}
        )
        args+=( --custom-repo . )
        for repo in "${CUSTOM_REPOS[@]}"; do
            args+=( --custom-repo "${repo}" )
        done

        # Pipe the run_test function's body into ebuild-commander
        type run_test | sed '1,3d;$d' | "${args[@]}"
    done
}

if [[ -n "$@" ]]; then
    main "$@"
else
    main tests/test-cases/*
fi
