#!/usr/bin/env bash

# A leaf ebuild test case to cover all ebuilds in the Spark overlay
# Portage configuration: FEATURES="test"

PORTAGE_CONFIGS=( tests/portage-configs/features-test )

. tests/resources/leaf-ebuilds/test-case-tmpl.sh
