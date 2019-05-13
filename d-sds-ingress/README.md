## 配置双向 TLS Ingress 网关
失败
```
$ curl -v -HHost:httpbin.example.com \
--resolve httpbin.example.com:$SECURE_INGRESS_PORT:$INGRESS_HOST \
--cacert httpbin.example.com/2_intermediate/certs/ca-chain.cert.pem \
https://httpbin.example.com:$SECURE_INGRESS_PORT/status/418
```
成功
```
$ curl -v -HHost:httpbin.example.com \
--resolve httpbin.example.com:$SECURE_INGRESS_PORT:$INGRESS_HOST \
--cacert httpbin.example.com/2_intermediate/certs/ca-chain.cert.pem \
--cert httpbin.example.com/4_client/certs/httpbin.example.com.cert.pem \
--key httpbin.example.com/4_client/private/httpbin.example.com.key.pem \
https://httpbin.example.com:$SECURE_INGRESS_PORT/status/418
```

[参考istio官网示例](https://istio.io/zh/docs/tasks/traffic-management/secure-ingress/sds/#generate-client-and-server-certificates-and-keys)