#!/usr/bin/bats

. test/common.sh

@test "supports prefix and suffix aliases" {
  diff -u \
    <(cq_f t:=<(printf "foo,bar\n1,2\n") -q 'select * from t;') \
    <(printf "foo,bar\n1,2\n")
  diff -u \
    <(cq_f <(printf "foo,bar\n1,2\n")=:t -q 'select * from t;') \
    <(printf "foo,bar\n1,2\n")
}
