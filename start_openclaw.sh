#!/bin/bash

echo "🚀 Booting up OpenClaw..."

# 1. Clean up any stuck processes
pkill -f "openclaw gateway" || true
pkill -f "openclaw telegram" || true

# 2. Start the Gateway securely in the background (Removed the invalid --host flag)
echo "Starting Gateway..."
nohup openclaw gateway start --auto-approve > gateway.log 2>&1 &

# Give the Gateway 5 seconds to wake up before connecting Telegram
sleep 5

# 3. Start the Telegram Bridge in the background
echo "Starting Telegram Bridge..."
nohup openclaw telegram start > telegram.log 2>&1 &

echo "✅ All systems go! OpenClaw is running."