#!/usr/bin/bats

. test/common.sh

@test "option to omit headers" {
  for option in +H --no-headers; do
    cq_f t:=<(printf "foo,bar\n1,2\n") "$option" -q 'select * from t;' \
    | diff -u - <(printf "1,2\n")
    cq_f t:=<(printf "foo,bar\n1,2\n") "$option" -o column -q 'select * from t;' \
    | diff -u - <(cat <<EOF
1           2         
EOF
    )
  done
}
