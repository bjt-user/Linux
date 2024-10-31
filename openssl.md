#### store certs from local service to a file

This might help:
```
openssl s_client -showcerts -connect [service_address]:[service_port] < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ca.crt
```
