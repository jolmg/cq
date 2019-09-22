#!/usr/bin/bats

. test/common.sh

@test "fail when provided multiple tables and no query" {
  ! cq_f foobar:=<(echo 'foo,bar') barbaz:=<(echo 'bar,baz')
  2>&1 cq_f foobar:=<(echo 'foo,bar') barbaz:=<(echo 'bar,baz') \
  | grep -F 'Error: Multiple tables to load and no query to run.'
}
