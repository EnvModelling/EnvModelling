#!/bin/bash
set -e

HOSTKEY_DIR=/ssh-host-keys

mkdir -p "${HOSTKEY_DIR}"

# Generate persistent SSH host keys on first run only.
if [ ! -f "${HOSTKEY_DIR}/ssh_host_ed25519_key" ]; then
    echo "Generating SSH host keys..."
    ssh-keygen -q -t ed25519 -N "" -f "${HOSTKEY_DIR}/ssh_host_ed25519_key"
fi

if [ ! -f "${HOSTKEY_DIR}/ssh_host_rsa_key" ]; then
    ssh-keygen -q -t rsa -b 3072 -N "" -f "${HOSTKEY_DIR}/ssh_host_rsa_key"
fi

exec /usr/sbin/sshd \
    -D \
    -e \
    -o HostKey="${HOSTKEY_DIR}/ssh_host_ed25519_key" \
    -o HostKey="${HOSTKEY_DIR}/ssh_host_rsa_key"
