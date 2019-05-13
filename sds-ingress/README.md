为 TLS Ingress 网关配置多个主机名
```
$ curl -v -HHost:helloworld-v1.example.com \
--resolve helloworld-v1.example.com:$SECURE_INGRESS_PORT:$INGRESS_HOST \
--cacert helloworld-v1.example.com/2_intermediate/certs/ca-chain.cert.pem \
https://helloworld-v1.example.com:$SECURE_INGRESS_PORT/hello
```
```
$ curl -v -HHost:httpbin.example.com \
--resolve httpbin.example.com:$SECURE_INGRESS_PORT:$INGRESS_HOST \
--cacert httpbin.example.com/2_intermediate/certs/ca-chain.cert.pem \
https://httpbin.example.com:$SECURE_INGRESS_PORT/status/418
```

[参考istio官网示例](https://istio.io/zh/docs/tasks/traffic-management/secure-ingress/sds/#generate-client-and-server-certificates-and-keys)