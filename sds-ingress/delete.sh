#!/bin/sh
kubectl delete --ignore-not-found=true -n istio-system secret httpbin-credential helloworld-credential

kubectl delete -f sds-ingress.yaml