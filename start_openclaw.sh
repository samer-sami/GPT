#!/bin/bash

echo "🚀 Booting up OpenClaw..."

# 1. Clean up any stuck processes from a previous session
pkill -f "openclaw gateway" || true
pkill -f "openclaw telegram" || true

# 2. Start the Gateway securely in the background
echo "Starting Gateway on port 18789..."
nohup openclaw gateway start --host 0.0.0.0 --auto-approve > gateway.log 2>&1 &

# Give the Gateway 5 seconds to wake up before connecting Telegram
sleep 5

# 3. Start the Telegram Bridge in the background
echo "Starting Telegram Bridge..."
nohup openclaw telegram start > telegram.log 2>&1 &

echo "✅ All systems go! OpenClaw is running."