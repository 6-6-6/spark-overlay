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
    if ! emerge "=${ebuild}"; then
        FAILED_EBUILDS+=( "${ebuild}" )
        continue
    fi
    echo -e "\nInstalling test dependencies of ${ebuild}"
    echo "=${ebuild} test" > /etc/portage/package.use/leaf-ebuilds
    if ! emerge -o "=${ebuild}"; then
        FAILED_EBUILDS+=( "${ebuild}" )
        rm /etc/portage/package.use/leaf-ebuilds
        continue
    fi
    echo -e "\nRunning tests for ${ebuild}"
    FEATURES="test" emerge "=${ebuild}" || FAILED_EBUILDS+=( "${ebuild}" )
    rm /etc/portage/package.use/leaf-ebuilds
done

if [[ -n "${FAILED_EBUILDS[@]}" ]]; then
    echo "Failed ebuilds:"
    tr '[:blank:]' '\n' <<< "${FAILED_EBUILDS[@]}"
    exit 1
fi
