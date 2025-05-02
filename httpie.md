## documentation

```
man http
```

https://httpie.io/docs/cli/usage

## installation

```
sudo pacman -S httpie
```

> human-friendly CLI HTTP client for the API era

## usage

#### help

```
http --help
```

#### simple get request

```
http Get example.com
```

#### show request as well (`-v`)

`-v`

By default only the response is shown.

> (...) print the whole request as well as the response.\
Also print any intermediary  requests/responses  (such as redirects).\
For the second level and higher, print these as well as the response meta data.

## examples

#### confluence get page by id

```
http GET "${CONFLUENCE_URL}/wiki/api/v2/pages/${page_id}" \
        -a "${CONFLUENCE_USER}:${CONFLUENCE_API_TOKEN}"
```
