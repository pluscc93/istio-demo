#/bin/sh
kubectl create secret -n jiesuan tls nginx-server-certs --key nginx.example.com/3_application/private/nginx.example.com.key.pem --cert nginx.example.com/3_application/certs/nginx.example.com.cert.pem
kubectl create secret -n jiesuan tls auth-server-certs --key auth.jiesuan.local/3_application/private/auth.jiesuan.local.key.pem --cert auth.jiesuan.local/3_application/certs/auth.jiesuan.local.cert.pem
kubectl create secret -n jiesuan tls www1-server-certs --key www1.jiesuan.local/3_application/private/www1.jiesuan.local.key.pem --cert www1.jiesuan.local/3_application/certs/www1.jiesuan.local.cert.pem

kubectl create configmap -n jiesuan nginx-configmap --from-file=nginx.conf=./nginx.conf
kubectl create configmap -n jiesuan ssl-configmap --from-file=./ssl

kubectl apply -f tls-ingress.yaml

# export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
