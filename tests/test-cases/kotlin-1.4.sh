#!/usr/bin/env bash

PORTAGE_CONFIGS=( tests/portage-configs/kotlin )

run_test() {
    USE="binary" emerge -1 \
        dev-java/kotlin-stdlib{,-js}:1.4 \
        dev-java/kotlin-reflect:1.4
    emerge dev-lang/kotlin-bin:1.4
    emerge -1 dev-java/kotlin-stdlib{,-js}:1.4 dev-java/kotlin-reflect:1.4
    emerge dev-java/kotlin-stdlib-jdk8:1.4
    FEATURES="test" emerge -1 \
        dev-java/kotlin-stdlib{,-jdk7,-jdk8}:1.4 \
        dev-java/kotlin-test{,-junit}:1.4 \
        dev-java/kotlin-coroutines-experimental-compat:1.4
}
