#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDetect()
{

  detect
  assertEquals 0 ${rtrn}
  assertEquals "" "$(cat ${STD_ERR})"
  assertEquals "pandoc" "$(cat ${STD_OUT})"
}
