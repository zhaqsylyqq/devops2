#!/usr/bin/env bash
set -euo pipefail
echo "[1] objects"
kubectl -n lab6 get ingress,svc,endpoints,pods -o wide
echo
echo "[2] test inside cluster: frontend"
kubectl -n lab6 run t-frontend --rm -i --restart=Never --image=busybox:1.28 -- sh -c "wget -qO- http://frontend-svc | head"
echo
echo "[3] test inside cluster: backend"
kubectl -n lab6 run t-backend --rm -i --restart=Never --image=busybox:1.28 -- sh -c "wget -qO- http://backend-svc | head"
