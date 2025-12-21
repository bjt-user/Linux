## general info

2025-12-21

```
$ time git clone https://github.com/helix-editor/helix.git
...
real	0m17.205s
```

```
$ cloc .
    1569 text files.
    1369 unique files.
     217 files ignored.

github.com/AlDanial/cloc v 2.06  T=0.95 s (1435.8 files/s, 390055.4 lines/s)
--------------------------------------------------------------------------------
Language                      files          blank        comment           code
--------------------------------------------------------------------------------
Text                             14             14              0         190559
Rust                            239          10764          11471          77372
Scheme                          826           7860           3396          33696
TOML                            220           3361           1779          22219
Markdown                         46           1185             17           6421
YAML                              7             90             44            499
Handlebars                        1             42             17            267
Nix                               4             32             27            258
CSS                               1             43              3            185
XML                               1             10              0            115
C++                               1              3              0             45
zsh                               1              2              2             31
Bourne Again Shell                1              3              1             28
Nushell                           1              3              6             20
Fish Shell                        1              2              2             18
SVG                               4              0              0              4
Bourne Shell                      1              1              0              2
--------------------------------------------------------------------------------
SUM:                           1369          23415          16765         331739
--------------------------------------------------------------------------------
```

Definitely less source code than vim.

## TODO: building

`src/building-from-source.md`

This FAILED:
```
cargo build
```

```
Failure 1/1: prolog Git command failed.
  Stdout:
  Stderr: fatal: unable to access 'https://codeberg.org/foxy/tree-sitter-prolog/': The requested URL returned error: 503


  --- stderr

  thread 'main' (41287) panicked at helix-term/build.rs:5:26:
  Failed to fetch tree-sitter grammars: 1 grammars failed to fetch
  note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
```

This works:
```
time cargo install --path helix-term --locked
real	8m37.915s
user	53m42.185s
sys	1m16.707s
```

Maybe try `cargo build --locked`.

Or try this:\
> If you do not want to fetch or build grammars, set an environment variable HELIX_DISABLE_AUTO_GRAMMAR_BUILD
