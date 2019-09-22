#!/usr/bin/bats

. test/common.sh

@test "default query to return input if one or no assignments provided" {
  diff -u \
    <(
      cq_f << EOF
foo,bar
1,2
EOF
    ) \
    <(
      cat << EOF
foo,bar
1,2
EOF
    )
  diff -u \
    <(
      cq_f foobar:=<(cat <<EOF
foo,bar
1,2
EOF
      )
    ) \
    <(
      cat << EOF
foo,bar
1,2
EOF
    )
}
