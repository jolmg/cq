#!/usr/bin/bats

. test/common.sh

@test "option to set output mode" {
  for option in -o --output-mode; do
    "$cq" t:=<(printf "foo,bar\n1,2\n") -o column -q 'select * from t;' \
    | diff -u - <(cat <<EOF
foo         bar       
----------  ----------
1           2         
EOF
    )
  done
}
