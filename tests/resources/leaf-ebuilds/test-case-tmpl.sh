#!/usr/bin/env bash

EMERGE_OPTS="--color y --verbose --quiet-build"

run_test() {
    emerge -1 sys-apps/pkgcore

    # pquery requires ::gentoo to be defined in repos.conf
    echo "[gentoo]" >> /etc/portage/repos.conf/gentoo.conf
    echo "location = /var/db/repos/gentoo" >> /etc/portage/repos.conf/gentoo.conf

    # Update pre-installed packages with required USE flags and versions
    emerge -1 dev-java/jsr305
    emerge -1 media-libs/freetype

    # Rebuild JDK with USE="-headless-awt"
    # https://bugs.gentoo.org/776910#c13
    USE="-headless-awt" emerge -1 dev-java/openjdk-bin:8 virtual/jdk:1.8

    # Install Kotlin 1.4
    USE="binary" emerge -1 dev-java/kotlin-{stdlib,reflect}:1.4
    emerge -1 dev-lang/kotlin-bin:1.4

    # Prepare to bootstrap some packages
    USE="binary" emerge -1 dev-java/gpars dev-java/yecht

    /var/db/repos/spark-overlay/tests/resources/leaf-ebuilds/emerge-leaves.sh
}
