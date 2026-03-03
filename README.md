# Nullclaw setup in `/workspace/Ish`

This repository is prepared with `main` and `nullclaw` branches and includes a one-command installer for Nullclaw on iSH/ARM64.

## Install Nullclaw (iPhone / iSH ARM64)
Install curl and inspect release assets:

```bash
apk add curl
curl -s https://api.github.com/repos/nullclaw/nullclaw/releases/latest | grep browser_download_url
```

Run the installer:

```bash
sh scripts/install_nullclaw.sh
```

The installer will:
- Ensure `curl` exists (installs with `apk` if needed)
- Query the latest release API
- Select the `nullclaw-linux-arm64` asset URL
- Download and install it to `/usr/local/bin/nullclaw`

Equivalent direct install command:

```bash
curl -L https://github.com/nullclaw/nullclaw/releases/latest/download/nullclaw-linux-arm64 -o nullclaw
chmod +x nullclaw
mv nullclaw /usr/local/bin/nullclaw
```

After install:

```bash
nullclaw --help
```

## Branches
- `main`
- `nullclaw`

## Publish to GitHub
```bash
git remote add origin <your-github-repo-url>
git push -u origin main
git push -u origin nullclaw
```
