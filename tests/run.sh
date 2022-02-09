#!/usr/bin/env bash

# ebuild Installation Test Launcher Script
#
# When running the script, please make sure the working directory is the root
# directory of this repository.
#
# Recognized environment variables:
# - UNSTABLE: When non-empty, accept the '~amd64' keyword for all test cases

DEFAULT_EMERGE_OPTS="--color y --verbose --keep-going"

main() {
    for script in "$@"; do
        unset DOCKER_IMAGE PROFILE GENTOO_REPO THREADS EMERGE_OPTS PULL
        unset STORAGE_OPTS PORTAGE_CONFIGS CUSTOM_REPOS SKIP_CLEANUP

        . "${script}"

        args=(
            ebuild-cmder
            --docker-image "${DOCKER_IMAGE:-ghcr.io/leo3418/gentoo-stage3-amd64-java}"
            --portage-config tests/portage-configs/default
            --custom-repo .
            --emerge-opts "${EMERGE_OPTS:-"${DEFAULT_EMERGE_OPTS}"}"
            ${UNSTABLE:+--portage-config tests/portage-configs/unstable}
            ${PROFILE:+--profile "${PROFILE}"}
            ${GENTOO_REPO:+--gentoo-repo "${GENTOO_REPO}"}
            ${THREADS:+--threads "${THREADS}"}
            ${PULL:+--pull}
            ${STORAGE_OPTS:+--storage-opts "${STORAGE_OPTS}"}
            ${SKIP_CLEANUP:+--skip-cleanup "${SKIP_CLEANUP}"}
        )
        for config in "${PORTAGE_CONFIGS[@]}"; do
            args+=( --portage-config "${config}" )
        done
        for repo in "${CUSTOM_REPOS[@]}"; do
            args+=( --custom-repo "${repo}" )
        done

        local script_content="$(type run_test | \
            sed '1,3d;$d' | sed 's/^[[:space:]]*//')"
        echo "Starting ebuild-commander with:"
        printf "'%s' " "${args[@]}"
        echo -e "\n"
        echo "Test script:"
        echo "${script_content}"
        echo

        # Pipe the run_test function's body into ebuild-commander
        "${args[@]}" <<< "${script_content}"
    done
}

if [[ -n "$@" ]]; then
    main "$@"
else
    main tests/test-cases/*
fi
