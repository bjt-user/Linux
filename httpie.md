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
Note: The headers need to be positioned AFTER the url!

#### --print / -p

from `man http`:
```
--print, -p WHAT

String specifying what the output should contain:

'H' request headers
'B' request body
'h' response headers
'b' response body
'm' response metadata

The default behaviour is 'hb' (i.e., the response headers and body is printed), if standard output is  not  redirected.\
If the output is piped to another program or to a file, then only the response body is printed by default.
```

For example to just get the response headers:
```
$ http -p h example.com
HTTP/1.1 200 OK
Accept-Ranges: none
Cache-Control: max-age=3402
Content-Encoding: gzip
Content-Length: 648
Content-Type: text/html
Date: Fri, 02 May 2025 11:47:10 GMT
ETag: "84238dfc8092e5d9c0dac8ef93371a07:1736799080.121134"
Last-Modified: Mon, 13 Jan 2025 20:11:20 GMT
Proxy-Connection: keep-alive
```

#### use ssl cert file

The `--verify=mysslcert.crt` must come before the http method.

```
- |
  http --print=hbm --verify="$CI_SERVER_TLS_CA_FILE" PUT \
    "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/generic/${BINARY}/latest/${BINARY}" \
    "JOB-TOKEN: ${CI_JOB_TOKEN}" < ${BINARY}
```

#### ignore ssl

```
http GET [URL] --verify false
```

#### download file

WARNING: Always use `--output` with `--download`!\
`httpie` tries to get the file name from the response headers \
and if it can't find the right header it will fail!

```
http -v GET --download [URL]
```

```
--download, -d
Do not print the response body to stdout.
Rather, download it and store it in a file.
The filename is guessed unless specified with --output [filename]. This action is similar to the default behaviour of wget.
```

#### upload file

```
http -v PUT [URL] < myfile.txt
```

#### authorization

`-a [USERNAME]:[PASSWORD]`

From `man http`:
```
--auth, -a USER[:PASS] | TOKEN
      For username/password based authentication mechanisms (e.g basic auth or digest auth) if only the username is provided (-a  user‐
      name), HTTPie will prompt for the password.
--auth-type, -A
      The authentication mechanism to be used. Defaults to "basic".
      "basic": Basic HTTP auth
      "digest": Digest HTTP auth
      "bearer": Bearer HTTP Auth
      To see all available auth types on your system, including ones installed via plugins, run:
      $ http --auth-type
```

#### setting the user agent

```
http --print Hh GET https://www.nasdaq.com/market-activity/index/ndx User-Agent:"John Doe"
```

## examples

#### confluence get page by id

```
http GET "${CONFLUENCE_URL}/wiki/api/v2/pages/${page_id}" \
        -a "${CONFLUENCE_USER}:${CONFLUENCE_API_TOKEN}"
```
