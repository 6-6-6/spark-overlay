
# emerge spark-core

## extra ECLASSES
### java-simple

- [x] need more error message
- [x] src\_test()
- [ ] pkgdiff
- [x] JAVA_SRC_DIR=("dir1" "dir2")
- [x] JAVA_TEST_SRC_DIR=("dir1" "dir2")
- [ ] weld-core(cal10n resource bundle)

### kotlin
1. okio
2. okhttp

### scala
1. spark-core
2. chill
3. json4s-scalap
4. jackson-module-scala
5. json4s-jackson

### ruby
1. jruby: ruby source files exist
2. jruby-complete

### lombok
1. lombok

## java-ebuilder

- [ ] deal with java-virtuals/\* packages
- [ ] test scope dependencies
- [ ] detect the need of tools.jar to support JAVA\_NEED\_TOOLS

## notes for dev-java

see [the memo for dev-java](dev-java/memo.md)

## notes for app-maven

see [the memo for app-maven](app-maven/memo.md)

## notes for java-virtuals

use java-virtuals/\* to manage javax-\* and jakarta-\*
