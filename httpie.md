## documentation

```
man http
```

https://httpie.io/docs/cli/usage

## installation

```
sudo pacman -S httpie
```

```
apk add httpie
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

#### pass query parameters

With `key==value` you can pass query parameters:
```
http GET "${CONFLUENCE_URL}/wiki/api/v2/pages/${id}" \
        body-format==editor \
        -a "${CONFLUENCE_USER}:${CONFLUENCE_API_TOKEN}" -v
```

Or you can just add them to the URL with a `?`.

## examples

#### confluence get page by id

```
http GET "${CONFLUENCE_URL}/wiki/api/v2/pages/${page_id}" \
        -a "${CONFLUENCE_USER}:${CONFLUENCE_API_TOKEN}"
```
