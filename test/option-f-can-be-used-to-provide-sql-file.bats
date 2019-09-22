#!/usr/bin/bats

. test/common.sh

@test "option -f can be used to provide sql file" {
  diff -u \
    <(
      cq_f -f <(printf "%s\n" 'select foo, bar + 10 as bar_2 from t;') << EOF
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
