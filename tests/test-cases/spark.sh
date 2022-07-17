#!/usr/bin/env bash

# A test case that runs the Spark demo from dev-java/spark-demo

EMERGE_OPTS="${DEFAULT_EMERGE_OPTS} --quiet-build"

run_test() {
    # Dependency bootstrap stage 1
    emerge -1 dev-lang/kotlin-bin:1.4
    # Dependency bootstrap stage 2
    emerge -1 dev-java/kotlin-{stdlib,reflect}:1.4

    emerge dev-java/spark-demo
    spark-demo-2.12 "$(nproc)"
}
