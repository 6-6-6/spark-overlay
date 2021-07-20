#!/usr/bin/env bash

EXCLUDED_EBUILDS=(
    # Kotlin ebuilds, covered by other test cases
    "dev-java/kotlin-stdlib-jdk8-1.4.32"
    "dev-java/kotlin-stdlib-jdk8-1.5.20"
    "dev-java/kotlin-test-js-1.4.32"
    "dev-java/kotlin-test-js-1.5.20"
)

: ${ELEAVES:=/var/db/repos/spark-overlay/tests/resources/leaf-ebuilds/eleaves.py}

LEAF_EBUILDS=$("${ELEAVES}" --algorithm rev-search spark-overlay || exit $?)
for excluded in "${EXCLUDED_EBUILDS[@]}"; do
    LEAF_EBUILDS=${LEAF_EBUILDS//"${excluded}"}
done
echo -e "\nLeaf ebuilds:"
tr '[:blank:]' '\n' <<< "${LEAF_EBUILDS}"

FAILED_EBUILDS=()
mkdir -p /etc/portage/package.use
for ebuild in ${LEAF_EBUILDS}; do
    echo -e "\nEmerging ${ebuild}"
    emerge "=${ebuild}" || FAILED_EBUILDS+=( "${ebuild}" )
done

if [[ -n "${FAILED_EBUILDS[@]}" ]]; then
    echo "Failed ebuilds:"
    tr '[:blank:]' '\n' <<< "${FAILED_EBUILDS[@]}"
    exit 1
fi
