#!/usr/bin/bats

. test/common.sh

@test "default query to return input if one or no assignments provided" {
  diff -u \
    <(
      "$cq" << EOF | tr -d $'\r'
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
      "$cq" foobar:=<(cat <<EOF
foo,bar
1,2
EOF
      ) | tr -d $'\r'
    ) \
    <(
      cat << EOF
foo,bar
1,2
EOF
    )
}
