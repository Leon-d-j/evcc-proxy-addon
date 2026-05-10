# Home Assistant Add-on: evcc Proxy

[![Supports aarch64](https://img.shields.io/badge/aarch64-yes-green.svg)](https://img.shields.io/badge/aarch64-yes-green.svg)
[![Supports amd64](https://img.shields.io/badge/amd64-yes-green.svg)](https://img.shields.io/badge/amd64-yes-green.svg)
[![Supports armhf](https://img.shields.io/badge/armhf-yes-green.svg)](https://img.shields.io/badge/armhf-yes-green.svg)
[![Supports armv7](https://img.shields.io/badge/armv7-yes-green.svg)](https://img.shields.io/badge/armv7-yes-green.svg)
[![Supports i386](https://img.shields.io/badge/i386-yes-green.svg)](https://img.shields.io/badge/i386-yes-green.svg)

This add-on creates a proxy to an evcc instance running separately from Home Assistant, so you can access the evcc UI directly from your Home Assistant sidebar — including when accessing HA remotely via the Companion App or Nabu Casa.

> **Note:** This add-on does **not** run evcc itself. You need a separate evcc instance already running on your network.

## Installation

1. Add this repository to your Home Assistant add-on store:

   [![Add repository to Home Assistant](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FLeon-d-j%2Fevcc-proxy-addon)

   Or manually: **Settings → Add-ons → Add-on Store → ⋮ → Repositories** and add:
   `https://github.com/Leon-d-j/evcc-proxy-addon`

2. Install the **evcc Proxy** add-on.

3. Go to the **Configuration** tab and set:
   - `evcc_ip`: the IP address of your evcc instance (e.g. `192.168.1.100`)
   - `evcc_port`: the port of your evcc instance (default: `7070`)

4. Start the add-on.

5. **evcc** will now appear in your Home Assistant sidebar.

## Configuration

```yaml
evcc_ip: "192.168.1.100"
evcc_port: 7070
```

| Option | Description |
|--------|-------------|
| `evcc_ip` | IP address of your evcc instance |
| `evcc_port` | Port of your evcc instance (default: 7070) |

## How it works

This add-on runs a lightweight nginx reverse proxy that forwards requests from the Home Assistant ingress system to your evcc instance. This means you can access evcc through the Home Assistant URL, including when using remote access via Nabu Casa or a reverse proxy.

WebSocket connections are fully supported, so evcc's live updates work correctly.

## Support

Found a bug or have a feature request? Please open an issue on [GitHub](https://github.com/Leon-d-j/evcc-proxy-addon/issues).
