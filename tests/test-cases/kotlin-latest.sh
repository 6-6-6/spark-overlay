#!/usr/bin/env bash

PORTAGE_CONFIGS=( tests/portage-configs/kotlin )

run_test() {
    # Library bootstrap stage 1
    USE="binary" emerge -1 dev-java/kotlin-stdlib{,-js} dev-java/kotlin-reflect
    emerge dev-lang/kotlin-bin
    # Library bootstrap stage 2
    emerge -1 dev-java/kotlin-stdlib{,-js} dev-java/kotlin-reflect
    # Library bootstrap stage 3
    find /var/db/repos/spark-overlay -type d -name 'kotlin-core-*' -fprintf core-pkgs '%P\n'
    xargs -a core-pkgs emerge -1 dev-java/kotlin-stdlib{,-js} dev-java/kotlin-reflect
    # Test additional packages
    emerge -1 dev-java/kotlin-test-js
    emerge dev-java/kotlin-stdlib-jdk8
    FEATURES="test" emerge -1 \
        dev-java/kotlin-stdlib{,-jdk7,-jdk8} \
        dev-java/kotlin-test{,-junit}
}
