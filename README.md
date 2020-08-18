
# The goal of this overlay
1. to make [java-ebuilder](https://github.com/6-6-6/java-ebuilder) ready to generate repoman-compatible ebuild files
2. to improve java-pkg-simple.eclass
3. to emerge spark-core

#
1. `emerge -1av spark-demo::maven`
2. `spark-demo-2.12 $(nproc)`

# TODO list
## java-ebuilder related
- [x] makefile-driven maven overlay
- [x] translate dev-java/\* into groupId:artifactId
- [ ] new movl
- [x] match version string that mvn artifacts may use
- [x] MAVEN_PROVIDES if one package jointly includes many artifacts
- [x] deal with java-virtuals/\* packages: discard ">="
- [ ] detect the need of tools.jar to support JAVA\_NEED\_TOOLS
- [x] install binary jar
- [ ] determine more testing frameworks (do not support spock now)
- [x] guess license from pom.xml
- [x] sort the provided keywords

## java-pkg-simple.eclass related
- [x] extend JAVA_SRC_DIR to array (JAVA_SRC_DIR=("dir1" "dir2"))
- [x] extend JAVA_TEST_SRC_DIR to array
- [x] src\_test()
- [x] junit-4 test
- [x] pkgdiff test
- [x] testng test
- [ ] junit-5 platform test
- [ ] cucumber-junit test

## emerging spark-core related
- [ ] emerge without USE="binary" (list of [pkgs](./pkgs-need-binary.txt) that needs "binary")
- [ ] a demo that works with spark-core

