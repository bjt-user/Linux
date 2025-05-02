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

## examples

#### confluence get page by id

```
http GET "${CONFLUENCE_URL}/wiki/api/v2/pages/${page_id}" \
        -a "${CONFLUENCE_USER}:${CONFLUENCE_API_TOKEN}"
```
