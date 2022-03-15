#!/usr/bin/env bash

EXCLUDED_EBUILD_PATTERNS=(
    # Kotlin ebuilds, covered by other test cases
    "dev-java/kotlin-stdlib-jdk8-.*"
    "dev-java/kotlin-test-js-.*"
    "virtual/kotlin-.*"
)

: ${ELEAVES:=/var/db/repos/spark-overlay/tests/resources/leaf-ebuilds/eleaves.py}

LEAF_EBUILDS_RAW=$("${ELEAVES}" --algorithm rev-search spark-overlay || exit $?)
echo -e "\nLeaf ebuilds to be tested:"
LEAF_EBUILDS=()
for ebuild in ${LEAF_EBUILDS_RAW}; do
    for pattern in "${EXCLUDED_EBUILD_PATTERNS[@]}"; do
        if grep -q -x "${pattern}" <<< "${ebuild}"; then
            # Match an ignore pattern, skip to the next ebuild
            continue 2
        fi
    done
    echo "${ebuild}"
    LEAF_EBUILDS+=( "${ebuild}" )
done

FAILED_EBUILDS=()
for ebuild in "${LEAF_EBUILDS[@]}"; do
    echo -e "\nEmerging ${ebuild}"
    emerge "=${ebuild}" || FAILED_EBUILDS+=( "${ebuild}" )
done

if [[ -n "${FAILED_EBUILDS[@]}" ]]; then
    echo "Failed ebuilds:"
    tr '[:blank:]' '\n' <<< "${FAILED_EBUILDS[@]}"
    exit 1
fi
