# DevOps II - Lab 2  
## Kubernetes Cluster + Ansible Automation + CI/CD

This project demonstrates deployment and automation of a Kubernetes cluster as part of DevOps II laboratory work.

The lab includes:
- Multi-node Kubernetes cluster (Minikube)
- Namespace, ConfigMap, Secret creation
- Infrastructure as Code using Ansible
- CI/CD pipeline using GitHub Actions

---

# Architecture Overview

Local environment:
- Windows + WSL2 (Ubuntu)
- Docker Desktop
- Minikube (3 nodes)
- kubectl
- Ansible (with Python virtual environment)

CI/CD environment:
- GitHub Actions
- Temporary Kubernetes cluster using `kind`
- Automated Ansible deployment

---

# Project Structure

lab2/
├── ansible/
│ ├── inventory
│ ├── playbook.yml
│ └── roles/k8s/tasks/main.yml
├── k8s/
│ ├── namespace.yaml
│ ├── configmap.yaml
│ └── secret.yaml
├── .github/workflows/ci.yml
├── .gitignore
└── README.md

---

# Local Deployment Guide

## Start Kubernetes Cluster

```bash
minikube start --nodes 3 --driver=docker --network=bridge
kubectl get nodes -o wide
```
## Run Ansible Deployment
```bash
cd ansible
source .venv/bin/activate
ansible-playbook -i inventory playbook.yml
```
## Verify Resources
```bash
kubectl get ns
kubectl -n lab2 get configmaps
kubectl -n lab2 get secrets
```

