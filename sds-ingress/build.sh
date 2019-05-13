#/bin/sh
kubectl create -n istio-system secret generic httpbin-credential --from-file=key=httpbin.example.com/3_application/private/httpbin.example.com.key.pem --from-file=cert=httpbin.example.com/3_application/certs/httpbin.example.com.cert.pem
kubectl create -n istio-system secret generic helloworld-credential \
--from-file=key=helloworld-v1.example.com/3_application/private/helloworld-v1.example.com.key.pem \
--from-file=cert=helloworld-v1.example.com/3_application/certs/helloworld-v1.example.com.cert.pem

kubectl apply -f sds-ingress.yaml

# export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
