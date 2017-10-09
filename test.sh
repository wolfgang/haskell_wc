#!/bin/bash

stack test
[ "$?" != "0" ] && exit $?
MYWC="stack exec wc --"

echo "---- Running end-to-end tests"
echo ""

output=$($MYWC -l ./test_files/3_lines.txt)
expected=$(wc -l ./test_files/3_lines.txt)

if [ "$output" != "$expected" ]; then
  echo "FAILURE!"
  echo "Expected: $expected"
  echo "But got:  $output"
  exit -1
else
  echo "SUCCESS!"
fi

output=$($MYWC -l ./test_files/4_lines.txt)
expected=$(wc -l ./test_files/4_lines.txt)

if [ "$output" != "$expected" ]; then
  echo "FAILURE!"
  echo "Expected: $expected"
  echo "But got:  $output"
  exit -1
else
  echo "SUCCESS!"
fi
