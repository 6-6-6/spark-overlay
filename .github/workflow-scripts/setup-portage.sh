#! /usr/bin/env bash
# Created by: Andrew Ammerlaan <andrewammerlaan@gentoo.org>
# Modified by: Yuan Liao <liaoyuan@gmail.com>
#
# This script sets up either Portage or repoman.  It was modified from
# 'scripts/setup-and-run-repoman.sh' that can be found under the source trees
# of GURU and Gentoo Science Overlay.  By default, this script sets up Portage.
# To set up repoman, pass the string "repoman" through the first positional
# parameter to this script.

PACKAGE="${1:-"portage"}"

### Setup prerequisites
python3 -m pip install --upgrade pip
pip install lxml pyyaml
sudo groupadd -g 250 portage
sudo useradd -g portage -d /var/tmp/portage -s /bin/false -u 250 portage

### Sync the portage repository
git clone https://github.com/gentoo/portage.git
cd portage

# Get all versions, and read into array
mapfile -t PACKAGE_VERSIONS < <( git tag | grep portage | sort -Vu )

# Select latest version (last element in array)
LATEST_VERSION="${PACKAGE_VERSIONS[-1]}"

# Checkout this version
git checkout tags/${LATEST_VERSION} -b ${LATEST_VERSION}

# Install the package
sudo ./setup.py install
if [[ "${PACKAGE}" == "repoman" ]]; then
    cd repoman
    sudo ./setup.py install
    sudo mkdir /usr/share/repoman
    sudo cp -r cnf/{linechecks,qa_data,repository} /usr/share/repoman
fi
