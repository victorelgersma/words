
#!/opt/homebrew/bin/bash
set -euo pipefail

# Folder name on the server and the live address. Change these once you pick a subdomain.
REMOTE_DIR="words"
URL="https://words.vjbe.net"

# Always run from the site root, wherever the script is called from
cd "$(dirname "$0")"

# 1. Build a fresh copy of the site (clears out stale files first)
rm -rf public
hugo --minify --baseURL "$URL/"

# 2. Deploy the built site to the remote folder
deploy public "$REMOTE_DIR"

echo
echo "🚀 Site deployment complete!"
echo "Check it out live at: $URL"
