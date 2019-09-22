#!/usr/bin/bats

. test/common.sh

@test "supports implicit names" {
  (
    d="$(mktemp -td cq-test-XXXXXX)"
    trap 'rm -r "$d"' EXIT
    printf 'foo,bar\n1,2\n' > "$d/foobar.csv"
    cq_f "$d/foobar.csv" -q 'select * from foobar;' \
    | diff -u - <(printf "foo,bar\n1,2\n")
  )
}
