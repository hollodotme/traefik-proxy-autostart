#!/bin/bash

DOCKER_APP=/Applications/Docker.app
DOCKER="/usr/local/bin/docker"
DOCKER_COMPOSE="/usr/local/bin/docker-compose"
TRAEFIK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo ${TRAEFIK_DIR}

# Create global gateway network, if not exists
${DOCKER} network create --driver bridge --attachable --internal=false gateway || true

# Open Docker, only if is not running
if (! ${DOCKER} stats --no-stream ); then
  # Start Docker.app
  open ${DOCKER_APP}
  # Wait until Docker daemon is running and has completed initialisation
  while (! ${DOCKER} stats --no-stream ); do
    # Docker takes a few seconds to initialize
    echo "Waiting for Docker to launch..."
    sleep 1
  done
fi

cd ${TRAEFIK_DIR}

${DOCKER_COMPOSE} up -d --force-recreate
