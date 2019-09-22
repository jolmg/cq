#!/usr/bin/bats

. test/common.sh

@test "default to stdin if no assignments given" {
  diff -u \
    <(
      cq_f -q 'select foo, bar + 10 as bar_2 from t;' << EOF
foo,bar
1,2
EOF
    ) \
    <(
      cat << EOF
foo,bar_2
1,12
EOF
    )
}
