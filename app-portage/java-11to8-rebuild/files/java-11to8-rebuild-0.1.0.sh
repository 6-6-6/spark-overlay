#!@GENTOO_PORTAGE_EPREFIX@/usr/bin/env bash

# java-11to8-rebuild.sh: Bulk rebuild Java packages in Spark overlay when
#                        switching from Java 11 back to Java 8.
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
    rebuild_pkgs=( $("${1}_pkgs") )
    popd > /dev/null
    if [[ -z "${rebuild_pkgs}" ]]; then
        echo -e "\033[1;33m * \033[0mNo $1 package is installed on the system"
        exit 0
    fi
    echo -e -n "\033[1;32m * \033[0mRunning \033[1;37memerge\033[0m "
    echo "to rebuild $1 packages ..."
    emerge --ask --oneshot "${rebuild_pkgs[@]}"
}

main() {
    if [[ "$0" == java-11to8-rebuild.sh ]]; then
        echo -e "\033[1;31m * \033[0m$0 is not to be invoked directly" >&2
        exit 1
    fi
    local program="$(basename "$0")"
    local pkg_group="${program%-11to8-rebuild}"
    if [[ -n "$1" ]]; then
        echo "${program} @VERSION@"
        "${pkg_group}_desc" 2> /dev/null
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
    rebuild "${pkg_group}"
}

# To add a new package group, e.g. 'foo':
#
# 1. Create a 'foo_desc' function that echoes a message explaining
#    this program's purpose and a summary of the package group,
#    e.g. "Rebuild packages related to foo."
#
# 2. Create a 'foo_pkgs' function that may search in directory
#    ${EPREFIX}/var/db/pkg to echo a list of '=${CATEGORY}/${PF}'
#    package atoms that belong to the package group and are
#    installed on the system.  The text echoed by this function
#    will be passed as arguments to 'emerge'.  Note that this
#    function will always be run with ${EPREFIX}/var/db/pkg as
#    the working directory.
#
#    This function is permitted to echo nothing to indicate that
#    no package in the package group is installed on the system.
#    This function should not echo a package atom that is not
#    installed on the system.
#
# 3. Create a new ebuild for this program that installs a symbolic
#    link to this script with link name /usr/bin/foo-11to8-rebuild.

h2o_desc() {
    echo "Rebuild H2O Java packages."
}

h2o_pkgs() {
    [[ -d dev-java ]] || return
    find dev-java -type d -name "h2o*" -printf "=%p "
}

jetty9_desc() {
    echo "Rebuild Jetty 9 packages, including Jetty 9 Websocket packages."
}

jetty9_pkgs() {
    [[ -d dev-java ]] || return
    local pkgs=( $(find dev-java \
        -type d -name "jetty*" -or -type d -name "websocket*") )
    local jetty9_pkgs
    for pkg in "${pkgs[@]}"; do
        [[ "$(cat "${pkg}/SLOT")" -eq 9 ]] && jetty9_pkgs+=( "=${pkg}" )
    done
    echo "${jetty9_pkgs[@]}"
}

main "$@"
