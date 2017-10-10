#!/bin/bash
function assert_equal
{
  actual=$1
  execpted=$2
  if [ "$actual" != "$expected" ]; then
    echo "FAILURE!"
    echo "Expected: $expected"
    echo "But got:  $actual"
    exit -1
  else
    echo "SUCCESS!"
  fi
}

function verify_output
{
  args=$1
  echo "Test $args"
  output="$($MYWC $args)"
  expected="$(wc $args)"
  assert_equal "$output" "$expected"
}

stack test
[ "$?" != "0" ] && exit $?
MYWC="stack exec wc --"

echo "---- Running end-to-end tests"
echo ""

verify_output "-l ./test_files/3_lines.txt"
verify_output "-l ./test_files/4_lines.txt"

verify_output "-w ./test_files/3_words.txt"
verify_output "-w ./test_files/7_words_in_3_lines.txt"
