#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompile() {
  compile
  assertEquals 0 ${rtrn}
  assertContains "Downloading pandoc 1.17.2" "$(cat ${STD_OUT})"
  assertContains "Extracting pandoc" "$(cat ${STD_OUT})"
  assertContains "Writing profile script" "$(cat ${STD_OUT})"

  capture $BUILD_DIR/.pandoc-dpkg/usr/bin/pandoc --help
  assertEquals 0 ${rtrn}
  assertContains "pandoc" "$(cat ${STD_OUT})"
}
