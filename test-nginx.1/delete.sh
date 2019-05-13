#!/bin/sh
kubectl delete -n jiesuan secret nginx-server-certs
kubectl delete -n jiesuan secret auth-server-certs
kubectl delete -n jiesuan configmap nginx-configmap
kubectl delete -f tls-ingress.yaml
