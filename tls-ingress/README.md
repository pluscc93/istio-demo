```
$ kubectl exec -it $(kubectl get pod  -l run=my-nginx -o jsonpath={.items..metadata.name}) -c istio-proxy -- curl -v -k --resolve nginx.example.com:443:127.0.0.1 https://nginx.example.com
```
```
$ curl -v --resolve nginx.example.com:$SECURE_INGRESS_PORT:127.0.0.1 --cacert nginx.example.com/2_intermediate/certs/ca-chain.cert.pem https://nginx.example.com:$SECURE_INGRESS_PORT
```

[参考istio官网示例](https://istio.io/zh/docs/examples/advanced-gateways/ingress-sni-passthrough/)