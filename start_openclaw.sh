#!/bin/bash

echo "🚀 Booting up OpenClaw..."

# 1. Safely kill ONLY the gateway process
pkill -f "openclaw gateway" || true

# 2. Start the Gateway and allow it to boot without prior config
echo "Starting Gateway..."
nohup openclaw gateway --port 18789 --allow-unconfigured > gateway.log 2>&1 &

echo "Waiting for Gateway to initialize..."
sleep 5

echo "✅ All systems go! OpenClaw is running."