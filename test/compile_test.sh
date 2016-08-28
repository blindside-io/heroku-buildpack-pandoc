#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompile() {
  compile
  assertEquals 0 ${rtrn}
  assertEquals "" "$(cat ${STD_ERR})"

  capture pandoc --help
  assertEquals 0 ${rtrn}
  assertContains "pandoc" "$(cat ${STD_OUT})"
}
