# Autostart a global traefik reverse proxy

This repository contains all configs needed to auto-start a global traefik instance as a reverse-proxy in a docker-compose setup.

The use case is described in my blog post: https://hollo.me/devops/routing-to-multiple-docker-compose-development-setups-with-traefik.html

## Installation

1. Clone this repository to `~/traefik`
2. Create the external docker network "gateway"
   ```bash
   docker network create \
   --driver=bridge \
   --attachable \
   --internal=false \
   gateway
   ```
3. Create the needed SSL-Certificates using [mkcert](https://github.com/FiloSottile/mkcert):
   ```bash
   mkcert "*.example.com"
   ```
   and change the config of certificates in the [certificates.toml](.docker/traefik/dynamic/certificates.toml), so that only your needed certificates are listed.
4. `cp ~/traefik/com.user.traefik.autostart.plist ~/Library/LaunchAgents/com.user.traefik.autostart.plist`
5. Load the service with `launchctl load ~/Library/LaunchAgents/com.user.traefik.autostart.plist`
6. Check the log file for errors: `tail -F ~/Library/Logs/traefik.autostart.log`
7. Visit http://127.0.0.1:8080/dashboard/#/ - You should see your traefik dashboard.

If you're not my future self, adapt the paths to the user's home directory in the configs before running anything. 😬
