#!/usr/bin/env python3

import argparse
import concurrent.futures
import os
import re
import shutil
import subprocess
import sys


def parse_args() -> argparse.Namespace:
    available_algorithms = []
    epilog = "The following algorithms are available:"
    if shutil.which('pquery') is not None:
        available_algorithms.append('rev-search')
        epilog += """
- rev-search (depends on sys-apps/pkgcore): For each ebuild in REPO, sees if
  it is a leaf ebuild by iterating over every package dependency specification
  in all ebuilds in REPO and testing if the ebuild meets the specification.
  Has better performance on repositories where only a small portion of ebuilds
  are leaves.  Note: metadata cache created by egencache(1) can significantly
  boost this algorithm's performance.\
"""
    if shutil.which('equery') is not None:
        available_algorithms.append('deps-traverse')
        epilog += """
- deps-traverse (depends on app-portage/gentoolkit): For each ebuild in REPO,
  traverses package dependency specifications in the ebuild and marks every
  dependency as non-leaf; then uses the complement of the set of non-leaf
  ebuilds as the result. Has better performance on repositories with a small
  total number of package dependency specifications in all ebuilds.\
"""
    if len(available_algorithms) == 0:
        print(f"""
{sys.argv[0]}: No search algorithm is available
Please install at least one of the following packages:
- sys-apps/pkgcore: Enables the 'rev-search' algorithm
- app-portage/gentoolkit: Enables the 'deps-traverse' algorithm\
""", file=sys.stderr)
        sys.exit(1)

    parser = argparse.ArgumentParser(
        usage="%(prog)s [OPTION]... REPO",
        description="""
Compute and print the list of leaf ebuilds in REPO to standard output.\
""",
        epilog=epilog,
        formatter_class=argparse.RawTextHelpFormatter
    )

    parser.add_argument(
        'repo',
        metavar='REPO',
        help=argparse.SUPPRESS
    )
    parser.add_argument(
        '--algorithm',
        metavar='ALGO',
        choices=available_algorithms,
        default=available_algorithms[0],
        help="select the algorithm used to search leaf ebuilds; more\n"
             "info below (default: %(default)s)"
    )

    return parser.parse_args()


def create_ebuild_dict(repo: str) -> dict:
    result = {}
    proc = subprocess.run(f'portageq --no-filters --repo {repo}',
                          capture_output=True, text=True,
                          shell=True, check=True)
    ebuilds = proc.stdout.splitlines()
    for ebuild in ebuilds:
        result[ebuild] = False
    return result


def rev_search(ebuild: str, has_rev_dep_dict: dict, repo: str) -> None:
    print(f"Processing {ebuild} ...", file=sys.stderr)
    proc = subprocess.run(f'pquery --first --raw --unfiltered'
                          f' --repo {repo} --restrict-revdep ={ebuild}',
                          capture_output=True, text=True, shell=True)
    has_rev_dep_dict[ebuild] = len(proc.stdout) > 0


def deps_traverse(ebuild: str, has_rev_dep_dict: dict) -> None:
    def get_dependencies() -> list:
        deps = []
        equery_dep_atom_pattern = re.compile(r'\(.+/.+\)')
        proc = subprocess.run(f'equery -CN depgraph -MUl {ebuild}',
                              capture_output=True, text=True, shell=True)
        out_lines = proc.stdout.splitlines()
        for line in out_lines:
            dep_atom_matches = equery_dep_atom_pattern.findall(line)
            dep_atom_matches = [dep.strip('()') for dep in dep_atom_matches]
            deps.extend(dep_atom_matches)
        return deps

    def find_matching_ebuilds(atom: str) -> list:
        proc = subprocess.run(f'equery list -op -F \'$cpv\' \'{atom}\'',
                              capture_output=True, text=True, shell=True)
        return proc.stdout.splitlines()

    print(f"Processing {ebuild} ...", file=sys.stderr)
    dep_atoms = get_dependencies()
    dep_ebuilds = []
    for dep_atom in dep_atoms:
        dep_ebuilds.extend(find_matching_ebuilds(dep_atom))
    for dep_ebuild in dep_ebuilds:
        if dep_ebuild in has_rev_dep_dict:
            has_rev_dep_dict[dep_ebuild] = True


def main() -> None:
    opts = parse_args()
    repo = opts.repo
    algorithm = opts.algorithm
    has_rev_dep_dict = create_ebuild_dict(repo)
    with concurrent.futures.ThreadPoolExecutor(max_workers=os.cpu_count()) \
            as executor:
        for ebuild in has_rev_dep_dict:
            if algorithm == 'rev-search':
                executor.submit(rev_search, ebuild, has_rev_dep_dict, repo)
            elif algorithm == 'deps-traverse':
                executor.submit(deps_traverse, ebuild, has_rev_dep_dict)
    for ebuild in has_rev_dep_dict:
        if not has_rev_dep_dict[ebuild]:
            print(ebuild)


if __name__ == '__main__':
    main()
