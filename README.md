# Autostart a global traefik reverse proxy

This repository contains all configs needed to auto-start a global traefik instance as a reverse-proxy in a docker-compose setup.

Currently the configs a tested on Mac OSX (Mojave) only.

## Installation

1. Clone this repository to `~/traefik`
2. `cp ~/traefik/com.user.traefik.autostart.plist ~/Library/LaunchAgents/com.user.traefik.autostart.plist`
3. Load the service with `launchctl load ~/Library/LaunchAgents/com.user.traefik.autostart.plist`
4. Check the log file for errors: `tail -F ~/Library/Logs/traefik.autostart.log`

If you're not my future self, adapt the paths to the user's home directory in the configs before running anything. 😬
