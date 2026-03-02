#!/bin/bash

echo "=== Checking token directory ==="
kubectl exec hardened-ubuntu -- ls /var/run/secrets/kubernetes.io/serviceaccount \
  || echo "✅ No service account token mounted"

echo "=== Checking user identity ==="
kubectl exec hardened-ubuntu -- id

echo "=== Attempting apt update (should fail) ==="
kubectl exec hardened-ubuntu -- apt update || echo "✅ apt failed as expected"

echo "=== Attempting privilege escalation ==="
kubectl exec hardened-ubuntu -- bash -c "whoami && su -" \
  || echo "✅ Privilege escalation blocked"
