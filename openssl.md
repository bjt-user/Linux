#### store certs from local service to a file

This should put the whole cert chain of the server into a file:
```
openssl s_client -showcerts -connect [service_address]:[service_port] < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ca.crt
```
