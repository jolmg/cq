cq=./cq

prepare_dir() {
  cq_test_dir="$(mktemp -td cq-test-XXXXXX)"
  trap 'rm -r "$cq_test_dir"' EXIT
  printf "%s\n" "$cq_test_dir"
}
