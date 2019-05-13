#!/bin/sh
kubectl delete secret nginx-server-certs
kubectl delete configmap nginx-configmap
kubectl delete service my-nginx
kubectl delete deployment my-nginx
kubectl delete gateway mygateway
kubectl delete virtualservice nginx
