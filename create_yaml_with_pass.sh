# https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/

cat <<EOF >./kustomization.yaml
secretGenerator:
- name: mysql-pass
  literals:
  - password=YOUR_PASSWORD
EOF