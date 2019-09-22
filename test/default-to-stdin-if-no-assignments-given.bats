#!/usr/bin/bats

. test/common.sh

@test "default to stdin if no assignments given" {
  diff -u \
    <(
      "$cq" -q 'select foo, bar + 10 as bar_2 from t;' << EOF | tr -d $'\r'
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
