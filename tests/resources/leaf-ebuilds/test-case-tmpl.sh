#!/usr/bin/env bash

EMERGE_OPTS="${DEFAULT_EMERGE_OPTS} --quiet-build"

run_test() {
    emerge -1 sys-apps/pkgcore

    # pquery requires ::gentoo to be defined in repos.conf
    echo "[gentoo]" >> /etc/portage/repos.conf/gentoo.conf
    echo "location = /var/db/repos/gentoo" >> /etc/portage/repos.conf/gentoo.conf

    # If keywords are accepted, update libffi and rebuild reverse dependencies
    emerge -1 ">=dev-libs/libffi-3.4" || true
    emerge @preserved-rebuild

    # Install Kotlin 1.4
    emerge -1 dev-lang/kotlin-bin:1.4

    /var/db/repos/spark-overlay/tests/resources/leaf-ebuilds/emerge-leaves.sh
}
