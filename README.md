# cq
Wrapper over sqlite inspired by jq for querying CSVs using SQL

## Examples of use

```
$ cat t/foobar.csv
foo,bar
1,2
$ cq t/foobar.csv -q 'select foo, bar + 10 as bar_2 from foobar;'
foo,bar_2
1,12
$ cat t/barbaz.csv
bar,baz
2,3
$ cq t/* -q 'select foo, baz from foobar, barbaz where foobar.bar = barbaz.bar;'
foo,baz
1,3
```

The tablenames are the basenames of the files without their optional .csv extension. One can also provide explicit names for the tables in 2 ways. One is with prefix assignment:

```
$ cq f:=t/foobar.csv b:=t/barbaz.csv -q 'select foo, baz from f, b where f.bar = b.bar;'
foo,baz
1,3
```

And the other one is with suffix assignment:

```
$ cq t/foobar.csv=:f t/barbaz.csv=:b -q 'select foo, baz from f, b where f.bar = b.bar;'
foo,baz
1,3
```

Notice one uses `:=` and the other one is flipped `=:`. The former looks better when combining with <() process expansion:

```
cq \
  a:=<(ssh server_a generate_csv) \
  b:=<(ssh server_b produce_different_csv)
```

The latter works better with brace expansion:

```
cq a/very/long/path/{long_filename=:a,elsewhere/another_file=:b}
```

Output headers can be disabled with `+H`, and re-enabled with `-H`. The last option overrides the formers so you can set a default in a shell alias.

```
$ cq +H t/foobar.csv -q 'select foo, bar from foobar;'
1,2
```

Output mode can be set with `-o`:

```
$ cq -o column t/foobar.csv -q 'select foo, bar from foobar;'
foo         bar       
----------  ----------
1           2         
```

Supported output modes can be listed with `sqlite3 <<< '.help mode'`.

There's a `--help` option for more.
