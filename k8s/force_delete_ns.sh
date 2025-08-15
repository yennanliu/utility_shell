#!/bin/bash
# Usage: ./force-delete-namespace.sh <name_space>

NS="my_name_space"

if [ -z "$NS" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi

echo "[INFO] Forcing deletion of namespace: $NS"

# Get the namespace JSON, remove finalizers
kubectl get namespace "$NS" -o json \
| jq '.spec.finalizers = []' \
| kubectl replace --raw "/api/v1/namespaces/${NS}/finalize" -f -

# Double-check if deletion is in progress
echo "[INFO] Namespace status after force delete:"
kubectl get ns "$NS" || echo "[OK] Namespace deleted."
