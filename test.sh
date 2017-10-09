#!/bin/bash

stack build
[ "$?" != "0" ] && exit $?
MYWC="stack exec wc --"

output=$($MYWC -l ./test_files/3_lines.txt)
expected=$(wc -l ./test_files/3_lines.txt)

if [ "$output" != "$expected" ]; then
  echo "FAILURE!"
  echo "Expected: $expected"
  echo "But got:  $output"
else
  echo "SUCCESS!"
fi

output=$($MYWC -l ./test_files/4_lines.txt)
expected=$(wc -l ./test_files/4_lines.txt)

if [ "$output" != "$expected" ]; then
  echo "FAILURE!"
  echo "Expected: $expected"
  echo "But got:  $output"
else
  echo "SUCCESS!"
fi
