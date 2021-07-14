#!/usr/bin/env bash

PORTAGE_CONFIGS=( tests/portage-config/kotlin )

run_test() {
    USE="binary" emerge -1 dev-java/kotlin-stdlib{,-js} dev-java/kotlin-reflect
    emerge dev-lang/kotlin-bin
    emerge -1 dev-java/kotlin-stdlib{,-js} dev-java/kotlin-reflect
    emerge dev-java/kotlin-stdlib-jdk8
    FEATURES="test" emerge -1 \
        dev-java/kotlin-stdlib{,-jdk7,-jdk8} \
        dev-java/kotlin-test{,-junit}
}
