#!/usr/bin/env bash
set -euo pipefail

cd /opt/keycloak

echo "==> Updating repo"
git fetch --all
git reset --hard origin/main

echo "==> Pulling latest containers"
docker compose pull

echo "==> Recreating services"
docker compose up -d

echo "==> Current status"
docker compose ps