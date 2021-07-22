#!/usr/bin/env bash

EMERGE_OPTS="--color y --verbose --quiet-build"

run_test() {
    emerge -1 sys-apps/pkgcore

    # pquery requires ::gentoo to be defined in repos.conf
    echo "[gentoo]" >> /etc/portage/repos.conf/gentoo.conf
    echo "location = /var/db/repos/gentoo" >> /etc/portage/repos.conf/gentoo.conf

    # Rebuild pre-installed packages with required USE flag settings
    emerge -1 media-libs/freetype

    /var/db/repos/spark-overlay/tests/resources/leaf-ebuilds/emerge-leaves.sh
}
