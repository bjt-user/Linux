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

This may be quoted (for better syntax highlighting in vim):
```
http GET \
        "${CONFLUENCE_URL}/wiki/api/v2/pages/${page_id}/versions" \
        -a "${CONFLUENCE_USER}:${CONFLUENCE_API_TOKEN}" \
        "limit==1" \
        Accept:application/json
```

Or you can just add them to the URL with a `?`.

#### send custom header

```
http GET example.com/api/v3 Accept:application/json -v
```

## examples

#### confluence get page by id

```
http GET "${CONFLUENCE_URL}/wiki/api/v2/pages/${page_id}" \
        -a "${CONFLUENCE_USER}:${CONFLUENCE_API_TOKEN}"
```
