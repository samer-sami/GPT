#!/bin/bash

echo "🚀 Starting OpenClaw Services..."

# 1. Kill any old processes to clear ports
pkill -f openclaw || true

# 2. Start the Gateway in the background
# --auto-approve handles the pairing automatically
# --host 0.0.0.0 is required for Codespaces networking
openclaw gateway start --host 0.0.0.0 --auto-approve &

echo "Waiting for Gateway to initialize..."
sleep 10

# 3. Start the Telegram bridge
# Using 'nohup' keeps it running even if the terminal closes
nohup openclaw telegram start > telegram.log 2>&1 &

echo "✅ All services launched!"
echo "Check telegram.log if the bot isn't responding."