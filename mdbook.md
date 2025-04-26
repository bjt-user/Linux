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
