# K8s Learning

This repo consist of some yaml files from K8s that hosts a `simple nodeJS server app(3)`, the intent of this repo is to deploy a simple application inside k8s in local machine and also to knoow about how networking works in k8s like `service` and what are
`NodePort, ClusterIP and LoadBalancer` in service, `ingress` what is the diff between `ingress and service` etc.

## Start with

- install `kind` on your machine, this basically creates k8s cluster in your local machine(u can customize how many worker nodes and control nodes.
- checkout this repo.
- first do `make create-cluster` this will create cluster with `1 master node and 3 worker nodes`
- `make deploy-apps` this will deploy all the apps into a namespace called `demo`, by default all the service is of `ClusterIP`, play around with it.
- `make create-lb` this will create a baremetal loadbalancer for our ingress service to use.
- `make create-nginx-ingress` this will install nginx-ingress related pods and services, in this one service will be of type LoadBalancer which uses the metallb externalIP provider.
- `make deploy-ingress` this deploys ingress rules of our apps.
