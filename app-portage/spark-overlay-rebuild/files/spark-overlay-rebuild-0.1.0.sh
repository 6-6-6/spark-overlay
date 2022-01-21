#!@GENTOO_PORTAGE_EPREFIX@/usr/bin/env bash

# spark-overlay-rebuild.sh: Bulk rebuild dev-java/*::spark-overlay packages.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

rebuild() {
    local rebuild_pkgs

    pushd @GENTOO_PORTAGE_EPREFIX@/var/db/pkg > /dev/null
    if [[ -d dev-java ]]; then
        rebuild_pkgs=( $(grep -lr spark-overlay dev-java | cut -d / -f 1-2) )
        rebuild_pkgs=( "${rebuild_pkgs[@]/#/=}" )
    fi
    popd > /dev/null

    if [[ -z "${rebuild_pkgs}" ]]; then
        echo -e -n "\033[1;33m * \033[0mNo dev-java/*::spark-overlay package "
        echo "is installed on the system"
        exit 0
    fi
    echo -e -n "\033[1;32m * \033[0mRunning \033[1;37memerge\033[0m "
    echo "to rebuild dev-java/*::spark-overlay packages ..."
    emerge --ask --oneshot "${rebuild_pkgs[@]}"
}

main() {
    local program="$(basename "$0")"
    if [[ -n "$1" ]]; then
        echo "${program} @VERSION@"
        echo "Rebuild dev-java/*::spark-overlay packages."
        echo "Invoke this program without any arguments to trigger a rebuild."
        echo
        echo "Copyright (C) 2022 Yuan Liao"
        echo -n "License GPLv3+: GNU GPL version 3 or later "
        echo "<https://gnu.org/licenses/gpl.html>."
        echo -n "This is free software: "
        echo "you are free to change and redistribute it."
        echo "There is NO WARRANTY, to the extent permitted by law."
        exit 0
    fi
    set -e
    rebuild
}

main "$@"
