cq_f() {
  # Remove the carriage returns that sqlite includes to facilitate
  # comparisons in tests.
  ./cq "$@" | tr -d $'\r'
}
