# Spark Overlay

[![Scan ebuilds with pkgcheck](https://github.com/6-6-6/spark-overlay/actions/workflows/pkgcheck.yml/badge.svg)](https://github.com/6-6-6/spark-overlay/actions/workflows/pkgcheck.yml)
[![Test ebuilds in Docker container](https://github.com/6-6-6/spark-overlay/actions/workflows/docker.yml/badge.svg)](https://github.com/6-6-6/spark-overlay/actions/workflows/docker.yml)

The Spark overlay is a Gentoo [ebuild repository][gentoo-wiki-ebuild-repo] that
offers Gentoo packages supporting big data infrastructures based on the Java
platform.  It was originally created for distributing [Apache Spark][spark] to
Gentoo users (hence the name "Spark overlay"), but it has been expanded later
to include packages for [H2O][h2o] and [Kotlin][kotlin] core libraries that can
[be built from source][gentoo-wiki-build-from-src].

[gentoo-wiki-ebuild-repo]: https://wiki.gentoo.org/wiki/Ebuild_repository
[spark]: https://spark.apache.org/
[h2o]: https://www.h2o.ai/
[kotlin]: https://kotlinlang.org/
[gentoo-wiki-build-from-src]: https://wiki.gentoo.org/wiki/FAQ#What_makes_Gentoo_different.3F

## Provided Packages

### Apache Spark

- `dev-java/spark-core`: The core package for Spark
- `dev-java/spark-demo`: A demo program for the Spark packages in this overlay,
  which can be run with command `spark-demo-2.12`

Note: Some dependencies of Spark require Kotlin compiler 1.4.  When being
pulled as a dependency, Kotlin compiler 1.4 might not be fully-automatically
installable by `emerge`.  If `emerge` comes up with any error pertaining to
Kotlin packages, please install Kotlin compiler 1.4 separately before retrying:

```console
# emerge --ask --oneshot dev-lang/kotlin-bin:1.4
```

### H2O

- `dev-java/h2o`: The meta package for H2O
  - Most H2O sub-packages are [slotted][gentoo-wiki-slot] based on the
    *major version* of H2O (e.g. 3.32, 3.34), so it is possible to install many
    major versions of H2O in parallel
  - The name of H2O's executable for a slot is `h2o-${SLOT}`; for example, the
    executable for H2O 3.32.x.y is `h2o-3.32`
- `dev-python/h2o-py`: The Python module for H2O
- `dev-java/h2o-flow`: The web-based interactive computational environment for
  H2O
  - To use H2O Flow, please enable the `flow` [USE flag][gentoo-wiki-use] of
    `dev-java/h2o`

[gentoo-wiki-slot]: https://wiki.gentoo.org/wiki/Handbook:Parts/Working/Portage#Terminology
[gentoo-wiki-use]: https://wiki.gentoo.org/wiki/Handbook:Parts/Working/USE

### Kotlin

For information regarding the Kotlin packages, please consult [the relevant
page on Gentoo Wiki][gentoo-wiki-kotlin].

[gentoo-wiki-kotlin]: https://wiki.gentoo.org/wiki/Kotlin

## Initial Configuration

The Spark overlay needs to be added to the system before the packages in it can
be installed.  This can be done with the following steps:

1. Because the Spark overlay is offered as a Git repository, Git must be
   installed before the repository's contents can be downloaded to the system.
   The following command ensures that Git is installed on the system:

   ```console
   # emerge --ask --noreplace dev-vcs/git
   ```

2. Add the Spark overlay to the system with *any* of the following method:

   - Enable the Spark overlay from `eselect-repository`:

     ```console
     # emerge --ask --noreplace app-eselect/eselect-repository
     # eselect repository enable spark-overlay
     ```

   - Manually add the repository definition to `/etc/portage/repos.conf`:

     ```ini
     [spark-overlay]
     location = /var/db/repos/spark-overlay
     sync-type = git
     sync-uri = https://github.com/6-6-6/spark-overlay.git
     ```

3. Download the contents of the Spark overlay to the system:

   ```console
   # emerge --sync spark-overlay
   ```

## Testing

The `tests` directory under the Spark overlay's Git tree contains scripts and
test cases for installation tests of the ebuilds in the Spark overlay.  These
tests are automatically run by [a GitHub Actions
workflow][gh-actions-workflow-docker] once a day to capture issues preventing
ebuilds in the Spark overlay from being installed caused by both problems in
those ebuilds themselves and changes in the official Gentoo ebuild repository
(like removal of packages needed by ebuilds in the Spark overlay).

[gh-actions-workflow-docker]: https://github.com/6-6-6/spark-overlay/actions/workflows/docker.yml

### Running the Tests Locally

The tests can be run in a local environment to replicate the jobs executed by
GitHub Actions:

1. Install [ebuild-commander][ebuild-cmder] -- the tool used to run the
   installation test cases -- in the local environment.  Please make sure every
   dependency required by ebuild-commander is installed too, because some of
   the dependencies are required during the runtime only, and missing runtime
   dependencies will not cause any errors in the installation process.

2. Change working directory to the top directory of the Spark overlay, then:
   - Run `tests/run.sh` to run all test cases stored under `tests/test-cases`.
   - Run `tests/run.sh TESTCASE...` to run one or more specific `TESTCASE`s.
     For example:
     - `tests/run.sh tests/test-cases/h2o.sh` runs the test case for H2O
       packages.
     - `tests/run.sh tests/test-cases/kotlin-latest.sh tests/test-cases/h2o.sh`
       runs the test case for Kotlin packages for the latest feature release
       and then the test case for H2O packages.

#### Notes

- Some test cases can take hours to run.

- The `tests/run.sh` script may indirectly invoke Docker via ebuild-commander,
  which might require `tests/run.sh` to be run as `root` and ebuild-commander
  to be installed globally for all users.

[ebuild-cmder]: https://github.com/Leo3418/ebuild-commander

### Working with the Test Cases

Test cases are stored in the `tests/test-cases` directory under the Spark
overlay's Git tree.  A test case's format is similar to an ebuild:

- A test case is written in Bash syntax, which will allow `tests/run.sh` to
  `source` it.

- A test case needs to have a `run_test` Bash function whose body contains the
  list of commands to run in the Docker container created by ebuild-commander
  for the test case.

  - Please note that ebuild-commander executes each command in the `run_test`
    function in a separate shell, even if the commands are separated by a
    semicolon instead of a newline.  This means that in `run_test`, variable
    declarations, `if` statements, `for` loops and so on do not work as
    expected.  There exist some workarounds:

    - Put any parts of the test case involving variable declarations and
      control flows into standalone scripts, and call the scripts in
      `run_test`.  The Spark overlay's Git tree will be available at
      `/var/db/repos/spark-overlay` in the Docker container created for the
      test.

    - Write variable values to files, and read those files to retrieve them
      later.

- A test case may define additional Bash variables recognized by `tests/run.sh`
  to control command-line options of ebuild-commander.

  - To find out which variables are supported, please refer to the content of
    `tests/run.sh`.

Besides `run.sh` and `test-cases`, the `tests` directory contains some other
sub-directories for files supporting test cases:

- `portage-configs`: Portage configurations for test cases
  - `default`: The default configuration, used by all test cases
  - `unstable`: A configuration that accepts the `~arch` keyword for all
    ebuilds, including those in `::gentoo`
    - This configuration is enabled automatically by `tests/run.sh` when the
      `UNSTABLE` environment variable's value is not empty.
  - `features-test`: A configuration that sets `FEATURES="test"` for ebuilds in
    the Spark overlay
  - `binary`: A configuration that sets `USE="binary"` for ebuilds in the Spark
    overlay
- `resources`: Scripts, programs and other miscellaneous files used by test
  cases
  - This is the best location to place any scripts that need to be called in
    the `run_test` function for a test case.  The path to this directory in the
    Docker container is `/var/db/repos/spark-overlay/tests/resources`.

### See Also

- [A walkthrough of the testing solution used for the Spark
  overlay](https://leo3418.github.io/2021/08/01/ebuild-repos-testing-solution.html)

## Contributing

The Spark overlay could still use some improvements.  Any contributions that
help resolve the following issues are welcome!

- [ ] Update Apache Spark packages to the latest upstream releases
- [ ] Update `dev-java/hadoop-*` and `dev-java/netty-*` packages to the latest
  upstream releases that do not have known security vulnerabilities
- [ ] Expand the family of H2O packages by adding packages for the H2O XGBoost
  and AutoML extension
- [ ] [Improve][gentoo-wiki-kotlin-improvements] Kotlin packages and eclasses
- [ ] Fix other documented issues in the [issue tracker][gh-issues]

[gentoo-wiki-kotlin-improvements]: https://wiki.gentoo.org/wiki/Kotlin/Open_Challenges_and_Room_for_Improvement
[gh-issues]: https://github.com/6-6-6/spark-overlay/issues
