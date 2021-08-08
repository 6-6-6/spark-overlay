#!/usr/bin/env bash

# A test case that runs H2O Python demos

run_test() {
    emerge dev-python/h2o-py dev-java/h2o
    nohup "$(find /usr/bin -regex '/usr/bin/h2o-[0-9]+\.[0-9]+')" > /dev/null 2>&1 &
    /var/db/repos/spark-overlay/tests/resources/h2o/run-builtin-demos.py
}
