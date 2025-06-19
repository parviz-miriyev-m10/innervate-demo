# Platform Ops Test Assignment: Kubernetes Autoscaling and Incident Response

---

## Repository Structure
```
innervate/
├── app/                   # Flask web application
│   ├── main.py            # Application with /, /chaos, /healthz endpoints
│   ├── requirements.txt   # Python dependencies
│   └── Dockerfile         # Container configuration
├── k8s/                   # Kubernetes manifests
│   ├── deployment.yaml    # Flask app deployment
│   ├── service.yaml       # Service exposure
│   ├── ingress.yaml       # Ingress configuration
│   ├── hpa.yaml           # Horizontal Pod Autoscaler
│   └── networkpolicy.yaml # Network security policies
├── terraform-google/      # Infrastructure as Code
│   └── create/            # GKE cluster provisioning
|   |__ modules/           # GKE terraform modules
├── docs/                  # Documentation and evidence
└── README.md              # Main documentation (this file)
```

---

## Table of Contents
1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Cluster Setup](#cluster-setup)
4. [Ingress Controller Installation](#ingress-controller-installation)
5. [Metrics Server Installation](#metrics-server-installation)
6. [Application Build & Deployment](#application-build--deployment)
7. [Autoscaling (HPA)](#autoscaling-hpa)
8. [Network Security](#network-security)
9. [Incident Simulation & Troubleshooting](#incident-simulation--troubleshooting)
10. [Useful Commands](#useful-commands)
11. [Troubleshooting](#troubleshooting)
12. [References](#references)

---

## 1. Overview
This repository demonstrates GKE cluster provisioning, secure app deployment, autoscaling, network policy enforcement, and incident response for a Flask web app.

---

## 2. Prerequisites
- Google Cloud Platform project with billing enabled
- [Google Cloud CLI](https://cloud.google.com/sdk/docs/install) (`gcloud`) installed
- [Terraform](https://www.terraform.io/downloads) v1.0+
- [Docker](https://docs.docker.com/get-docker/) installed
- [kubectl](https://kubernetes.io/docs/tasks/tools/) installed

---

## 3. Cluster Setup
```bash
cd terraform-google/create
# Edit terraform.tfvars with your values
terraform init
terraform plan
terraform apply
```

---

## 4. Ingress Controller Installation
Install NGINX Ingress:
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.3/deploy/static/provider/cloud/deploy.yaml
kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx
```

---

## 5. Metrics Server Installation
Install metrics-server:
```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl get deployment metrics-server -n kube-system
kubectl top pods
```

---

## 6. Application Build & Deployment
**Build and push Docker image:**
```bash
cd innervate/app
docker build -t guestfish/innervate-demo:latest .
docker push guestfish/innervate-demo:latest
```
**Deploy to Kubernetes:**
```bash
kubectl apply -f ../k8s/deployment.yaml
kubectl apply -f ../k8s/service.yaml
kubectl apply -f ../k8s/ingress.yaml
kubectl apply -f ../k8s/hpa.yaml
kubectl apply -f ../k8s/networkpolicy.yaml
```

---

## 7. Autoscaling (HPA)
- HPA is configured to scale on both CPU and memory (see `k8s/hpa.yaml`).
- Generate load:
  ```bash
  hey -n 2000 -c 50 http://localhost:8080/
  ```
- Watch scaling:
  ```bash
  kubectl get hpa flask-app
  kubectl get pods
  ```

---

## 8. Network Security
- Network policies restrict pod-to-pod communication and only allow ingress from the ingress controller.
- Test with pod exec and curl:
  ```bash
  kubectl get pods -o wide -l app=flask-app
  kubectl exec -it <pod-1> -- /bin/sh
  # Inside pod:
  curl http://<pod-2-ip>:8080/
  # Should fail
  curl http://localhost:8080/
  # Should succeed
  ```

---

## 9. Incident Simulation & Troubleshooting
- Trigger chaos:
  ```bash
  curl http://localhost:8080/chaos
  ```
- Watch pod restarts:
  ```bash
  kubectl get pods -w
  ```
- Check logs and health endpoints:
  ```bash
  kubectl logs <flask-app-pod>
  kubectl exec -it <flask-app-pod> -- curl http://localhost:8080/healthz
  ```

---

## 10. Useful Commands
```bash
kubectl get all
kubectl describe <resource> <name>
kubectl logs <pod-name>
kubectl exec -it <pod-name> -- /bin/sh
kubectl top pods
```

---

## 11. Troubleshooting
- **Image pull errors:** Ensure Docker image is pushed to GCR
- **Ingress not working:** Check ingress controller installation
- **HPA not scaling:** Verify metrics server is running and resource requests/limits are set
- **Network policies blocking traffic:** Check label selectors and ingress rules

---

## 12. References
- [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/deploy/)
- [Metrics Server](https://github.com/kubernetes-sigs/metrics-server)
- [Kubernetes HPA](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
- [Kubernetes Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
