#! /usr/bin/env bash
# Created by: Andrew Ammerlaan <andrewammerlaan@gentoo.org>
# Modified by: Yuan Liao <liaoyuan@gmail.com>
#
# This script fetches and sets up the latest copy of ::gentoo.  It was modified
# from 'scripts/setup-master-gentoo.sh' that can be found under the source
# trees of GURU and Gentoo Science Overlay.

sudo mkdir -p /var/db/repos/gentoo /etc/portage /var/cache/distfiles
wget -qO - "https://github.com/gentoo-mirror/gentoo/archive/master.tar.gz" | sudo tar xz -C /var/db/repos/gentoo --strip-components=1
sudo wget "https://www.gentoo.org/dtd/metadata.dtd" -O /var/cache/distfiles/metadata.dtd
# Use a directory instead of a single file for /etc/portage/repos.conf
sudo mkdir -p /etc/portage/repos.conf
sudo wget "https://gitweb.gentoo.org/proj/portage.git/plain/cnf/repos.conf" -O /etc/portage/repos.conf/gentoo.conf
sudo ln -s /var/db/repos/gentoo/profiles/default/linux/amd64/17.1 /etc/portage/make.profile
