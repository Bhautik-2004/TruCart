#!/bin/bash
# EC2 user-data script (Amazon Linux 2023) — installs Docker + Compose plugin
# and clones TruCart so it's ready for `docker compose up` after SSH login.
set -euo pipefail

dnf update -y
dnf install -y docker git

systemctl enable --now docker
usermod -aG docker ec2-user

DOCKER_CONFIG=/usr/local/lib/docker/cli-plugins
mkdir -p "$DOCKER_CONFIG"
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
  -o "$DOCKER_CONFIG/docker-compose"
chmod +x "$DOCKER_CONFIG/docker-compose"

sudo -u ec2-user git clone https://github.com/Bhautik-2004/TruCart.git /home/ec2-user/TruCart
