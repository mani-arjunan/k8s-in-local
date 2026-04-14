build-all:
	cd ./app1 && npm run build && \
	cd ../app2 && npm run build && \
	cd ../app3 && npm run build && \
	kind load docker-image app-1:latest && \
	kind load docker-image app-2:latest && \
	kind load docker-image app-3:latest

apply-labels:
	kubectl label nodes $(NODE) role=backend

create-lb:
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/config/manifests/metallb-native.yaml && \
	sleep 60 && \
	kubectl apply -f lb-ip.yaml

create-cluster:
	kind create cluster --config kind.yaml && \
	kubectl create namespace demo

create-nginx-ingress:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

delete-cluster:
	kind delete cluster

deploy-apps: build-all
	kubectl apply -f app1/k8s.yaml -f app2/k8s.yaml -f app3/k8s.yaml

delete-apps:
	kubectl delete -f app1/k8s.yaml -f app2/k8s.yaml -f app3/k8s.yaml

deploy-ingress:
	kubectl apply -f app1/ingress.yaml -f app2/ingress.yaml -f app3/ingress.yaml

