#!/usr/bin/env bash

# A test case that runs the Spark demo from dev-java/spark-demo

EMERGE_OPTS="${DEFAULT_EMERGE_OPTS} --quiet-build"

run_test() {
    # Rebuild Python dependencies installed in stage3 using Python 3.10
    emerge -DU @world

    # Dependency bootstrap stage 1
    emerge -1 dev-lang/kotlin-bin:1.4
    # Dependency bootstrap stage 2
    emerge -1 dev-java/kotlin-{stdlib,reflect}:1.4

    emerge dev-java/spark-demo
    spark-demo-2.12 "$(nproc)"
}
