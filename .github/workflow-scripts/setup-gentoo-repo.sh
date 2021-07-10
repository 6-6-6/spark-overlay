#!/usr/bin/env bash

sudo mkdir -p /var/db/repos/gentoo /etc/portage
wget -qO - "https://github.com/gentoo-mirror/gentoo/archive/master.tar.gz" | sudo tar xz -C /var/db/repos/gentoo --strip-components=1
