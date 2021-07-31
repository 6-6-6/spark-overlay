#!/usr/bin/env bash

EMERGE_OPTS="${DEFAULT_EMERGE_OPTS} --quiet-build"

run_test() {
    emerge -1 sys-apps/pkgcore

    # pquery requires ::gentoo to be defined in repos.conf
    echo "[gentoo]" >> /etc/portage/repos.conf/gentoo.conf
    echo "location = /var/db/repos/gentoo" >> /etc/portage/repos.conf/gentoo.conf

    # Update pre-installed packages with required USE flags and versions
    emerge -1 dev-java/jsr305

    # Install Kotlin 1.4
    USE="binary" emerge -1 dev-java/kotlin-{stdlib,reflect}:1.4
    emerge -1 dev-lang/kotlin-bin:1.4

    # Prepare to bootstrap some packages
    mkdir -p /etc/portage/package.use
    echo "dev-java/gpars binary" \
        >> /etc/portage/package.use/leaf-ebuilds-bootstrap
    echo "dev-java/yecht binary" \
        >> /etc/portage/package.use/leaf-ebuilds-bootstrap
    emerge -1 dev-java/gpars dev-java/yecht
    # Bootstrap to stage 2 if USE="-binary"
    rm /etc/portage/package.use/leaf-ebuilds-bootstrap
    emerge -N1 dev-java/gpars dev-java/yecht

    /var/db/repos/spark-overlay/tests/resources/leaf-ebuilds/emerge-leaves.sh
}
