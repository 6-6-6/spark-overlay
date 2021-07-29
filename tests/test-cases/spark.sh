#!/usr/bin/env bash

# A test case that verifies if the instructions in README.md work

EMERGE_OPTS="--color y --verbose --quiet-build"

run_test() {
    # Update dependencies pre-installed in the Docker image
    emerge -1 dev-java/jsr305

    # Set USE flags for packages that cannot be compiled from source yet
    ln -s /var/db/repos/spark-overlay/pkgs-need-binary.txt \
        /etc/portage/package.use/spark-overlay

    # Dependency bootstrap stage 1
    mkdir -p /etc/portage/package.use
    echo "dev-java/kotlin-stdlib binary" \
        >> /etc/portage/package.use/spark-deps-binary
    echo "dev-java/kotlin-reflect binary" \
        >> /etc/portage/package.use/spark-deps-binary
    echo "dev-java/gpars binary" \
        >> /etc/portage/package.use/spark-deps-binary
    echo "dev-java/yecht binary" \
        >> /etc/portage/package.use/spark-deps-binary
    emerge -1 dev-lang/kotlin-bin:1.4 dev-java/gpars dev-java/yecht

    # Dependency bootstrap stage 2
    rm /etc/portage/package.use/spark-deps-binary
    emerge -N1 dev-java/kotlin-{stdlib,reflect}:1.4 \
        dev-java/gpars dev-java/yecht

    emerge dev-java/spark-demo
    spark-demo-2.12 "$(nproc)"
}
