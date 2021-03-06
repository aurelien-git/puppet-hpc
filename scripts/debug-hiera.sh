#!/bin/bash

environment=${CONFIG_ENVIRONMENT:-production}
cluster_name=${CLUSTER_NAME:-mycluster}

scope_file=$(mktemp --tmpdir debug-hiera-scope-file_XXXXXX)

if [ -z "${scope_file}" ]
then
  echo "Fail to create temporary scope file" >&2
  exit 1
fi

cat > "${scope_file}" << EOF
environment: ${environment}
cluster_name: ${cluster_name}
EOF

hiera -c /etc/puppet/hiera.yaml -y "${scope_file}" "${@}"

rm "${scope_file}"
