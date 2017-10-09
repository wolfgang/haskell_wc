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

stack test
[ "$?" != "0" ] && exit $?
MYWC="stack exec wc --"

echo "---- Running end-to-end tests"
echo ""

output="$($MYWC -l ./test_files/3_lines.txt)"
expected="$(wc -l ./test_files/3_lines.txt)"

assert_equal "$output" "$expected"

output=$($MYWC -l ./test_files/4_lines.txt)
expected=$(wc -l ./test_files/4_lines.txt)

assert_equal "$output" "$expected"

output="$($MYWC -w ./test_files/3_words.txt)"
expected="$(wc -w ./test_files/3_words.txt)"

assert_equal "$output" "$expected"
