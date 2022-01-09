#!/usr/bin/env bash

# A test case that runs H2O Python demos

run_test() {
    # If keywords are accepted, update libffi and rebuild reverse dependencies
    emerge -1 ">=dev-libs/libffi-3.4" || true
    emerge @preserved-rebuild

    emerge dev-python/h2o-py dev-java/h2o
    # Start an H2O server
    nohup "$(find /usr/bin -regex '/usr/bin/h2o-[0-9]+\.[0-9]+')" > /dev/null 2>&1 &
    /var/db/repos/spark-overlay/tests/resources/h2o/run-builtin-demos.py
}
