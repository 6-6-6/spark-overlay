#! /usr/bin/env bash
# Created by: Andrew Ammerlaan <andrewammerlaan@gentoo.org>
# Modified by: Yuan Liao <liaoyuan@gmail.com>
#
# This script sets up Portage.  It was modified from
# 'scripts/setup-and-run-repoman.sh' that can be found under the source trees
# of GURU and Gentoo Science Overlay.

### Setup prerequisites
python3 -m pip install --upgrade pip
pip install lxml pyyaml
sudo groupadd -g 250 portage
sudo useradd -g portage -d /var/tmp/portage -s /bin/false -u 250 portage

### Sync the portage repository
git clone https://github.com/gentoo/portage.git
cd portage

# Get all versions, and read into array
mapfile -t PORTAGE_VERSIONS < <( git tag | grep portage | sort -Vu )

# Select latests version (last element in array)
PORTAGE_VERS="${PORTAGE_VERSIONS[-1]}"

# Checkout this version
git checkout tags/${PORTAGE_VERS} -b ${RM_VERS}

# Install Portage
sudo ./setup.py install
