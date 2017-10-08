#!/bin/bash

stack build
[ "$?" != "0" ] && exit $?
WC="stack exec wc --"

output=$($WC -l ./test_files/3_lines.txt)
expected=$(wc -l ./test_files/3_lines.txt)

if [ "$output" != "$expected" ]; then
  echo "FAILURE!"
  echo "Expected: $expected"
  echo "But got:  $output"
else
  echo "SUCCESS!"
fi

output=$($WC -l ./test_files/4_lines.txt)
expected=$(wc -l ./test_files/4_lines.txt)

if [ "$output" != "$expected" ]; then
  echo "FAILURE!"
  echo "Expected: $expected"
  echo "But got:  $output"
else
  echo "SUCCESS!"
fi
