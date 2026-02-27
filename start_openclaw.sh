

#!/bin/bash

echo "🚀 Restoring OpenClaw Configuration..."

# 1. Kill any existing gateway processes
pkill -f "openclaw gateway" || true

# 2. Re-apply your credentials (self-healing config)
# FILL IN YOUR ACTUAL KEYS BELOW:
echo "🔧 Applying security and API settings..."
openclaw config set gateway.auth.token "P@$$word123"
openclaw config set channels.telegram.botToken "7668105704:AAHcybeP7uLWb5OulKwBWjvewEM530CQSCA"
openclaw config set channels.telegram.enabled true

# 3. Launch the Gateway
echo "🛰️ Starting Gateway on Port 18789..."
nohup openclaw gateway --port 18789 --allow-unconfigured > gateway.log 2>&1 &

echo "Waiting for Gateway to initialize..."
sleep 5

echo "✅ OpenClaw is online! Use your password to log in at Port 18789."