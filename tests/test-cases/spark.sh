#!/usr/bin/env bash

# A test case that runs the Spark demo from dev-java/spark-demo

EMERGE_OPTS="${DEFAULT_EMERGE_OPTS} --quiet-build"

run_test() {
    # If keywords are accepted, update libffi and rebuild reverse dependencies
    emerge -1 ">=dev-libs/libffi-3.4" || true
    emerge @preserved-rebuild

    # Dependency bootstrap stage 1
    mkdir -p /etc/portage/package.use
    echo "dev-java/yecht binary" \
        >> /etc/portage/package.use/spark-deps-binary
    emerge -1 dev-lang/kotlin-bin:1.4 dev-java/yecht

    # Dependency bootstrap stage 2
    rm /etc/portage/package.use/spark-deps-binary
    emerge -N1 dev-java/kotlin-{stdlib,reflect}:1.4 dev-java/yecht

    emerge dev-java/spark-demo
    spark-demo-2.12 "$(nproc)"
}
