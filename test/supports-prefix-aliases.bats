#!/usr/bin/bats

@test "supports prefix and suffix aliases" {
  diff -u \
    <(./cq t:=<(printf "foo,bar\n1,2\n") -q 'select * from t;') \
    <(printf "foo,bar\r\n1,2\r\n")
  diff -u \
    <(./cq <(printf "foo,bar\n1,2\n")=:t -q 'select * from t;') \
    <(printf "foo,bar\r\n1,2\r\n")
}
