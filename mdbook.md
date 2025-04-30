## installation

```
sudo pacman -S mdbook
```

## usage

#### commands (mdbook help)

```
$ mdbook help
Creates a book from markdown files

Usage: mdbook [COMMAND]

Commands:
  init         Creates the boilerplate structure and files for a new book
  build        Builds a book from its markdown files
  test         Tests that a book's Rust code samples compile
  clean        Deletes a built book
  completions  Generate shell completions for your shell to stdout
  watch        Watches a book's files and rebuilds it on changes
  serve        Serves a book at http://localhost:3000, and rebuilds it on changes
  help         Print this message or the help of the given subcommand(s)
```

#### create skeleton

```
mdbook init
```
Then you will have your markdown files in the `src` dir.

The `SUMMARY.md` file is important as it lists all your files.

#### how to create markdown files

In the `src` dir you have all your markdown files.\
The markdown files can also embed images.\
It works the same way as it works in Gitlab or when using `pandoc`.\
You may just have a subdir with your images that are embedded in markdown.

You need to update `SUMMARY.md` when you create a new md file.

#### open book in browser

```
mdbook serve -o
```

#### open local webserver on port 3000

You need to be in the root dir.
```
mdbook serve
```
Then open `firefox` and open `http://localhost:3000`.

With left and right arrow keys you can navigate to the next/previous page.

#### mdbook build

```
mdbook build
```

In the `book` dir you will find the html files \
that you can open with firefox.

#### web view

A very useful feature is that you can search through the entire "book" by hitting the search \
button or pressing `s`.

You can also choose between different color themes.

You can print the entire book.

You can toggle the toc on/off.

#### footnotes

https://rust-lang.github.io/mdBook/format/markdown.html?highlight=References#footnotes

The syntax is `[^mylabel]` and the label in the text and the label on the bottom need to fit.\
The footnotes are numbered automatically.

Example:
```
> StartLimitIntervalSec=interval, StartLimitBurst=burst \
(...)
Units which are started more than burst times within an interval time span \
are not permitted to start any more. [^noteone]

Current Settings: [^notetwo]

More text.

[^noteone]: `man 5 systemd.unit` (l. 660)
[^notetwo]: second footnote
```
