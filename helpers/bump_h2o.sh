#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]; then
    echo "Usage: $0 PVR"
    echo "Bump the version of H2O ebuilds to the specified PVR."
    echo "ebuilds are searched recursively under the current working directory."
    exit 1
fi

# The program used to create manifests, will be invoked as
#   "${MANIFEST_CREATOR} manifest"
#
# Usage:
# - Invoke the manifest creator with superuser privilege, e.g.:
#   MANIFEST_CREATOR="sudo pkgdev"
# - Use an alternative program to create manifests, e.g.:
#   MANIFEST_CREATOR="repoman"
MANIFEST_CREATOR="${MANIFEST_CREATOR:-pkgdev}"

# PNs that should not be bumped by this script
PN_EXCLUDES=(
    h2o-flow
    h2o-tree-api
)

PVR="$1"

for pkg_dir in $(find -type d -name "h2o*" -printf "%P\n"); do
    PN="$(basename "${pkg_dir}")"

    for excluded in "${PN_EXCLUDES[@]}"; do
        [[ "${PN}" == "${excluded}" ]] && continue 2
    done

    echo "Entering directory ${pkg_dir}"
    pushd "${pkg_dir}" > /dev/null
    ebuilds_rev_sorted=( $(ls -rv "${PN}"-*.ebuild) )
    new_ebuild="${PN}-${PVR}.ebuild"
    cp -v "${ebuilds_rev_sorted[0]}" "${new_ebuild}"
    echo "${MANIFEST_CREATOR} manifest"
    ${MANIFEST_CREATOR} manifest
    popd > /dev/null
done
