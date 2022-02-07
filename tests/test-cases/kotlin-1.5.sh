#!/usr/bin/env bash

# A test case for packages for Kotlin 1.5

PORTAGE_CONFIGS=( tests/portage-configs/kotlin )

run_test() {
    # Bootstrap libraries for stage 1 will be installed
    emerge dev-lang/kotlin-bin:1.5
    # Library bootstrap stage 2
    emerge -1 dev-java/kotlin-stdlib:1.5 dev-java/kotlin-reflect:1.5
    # Library bootstrap stage 3
    find /var/db/repos/spark-overlay -type d -name 'kotlin-core-*' \
        -printf '%P:1.5\0' | xargs -0 emerge -1 \
        dev-java/kotlin-stdlib{,-js}:1.5 dev-java/kotlin-reflect:1.5
    # Test additional packages
    emerge -1 dev-java/kotlin-test-js:1.5
    emerge dev-java/kotlin-stdlib-jdk8:1.5
    FEATURES="test" emerge -1 \
        dev-java/kotlin-stdlib{,-jdk7,-jdk8}:1.5 \
        dev-java/kotlin-test{,-junit}:1.5
}
