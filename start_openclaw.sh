#!/bin/bash

echo "🚀 Booting up OpenClaw..."

# 1. Kill any stuck processes
pkill -f openclaw || true

# 2. Start the Gateway (This automatically starts Telegram too!)
echo "Starting Gateway..."
nohup openclaw gateway --port 18789 > gateway.log 2>&1 &

echo "Waiting for Gateway to initialize..."
sleep 5

echo "✅ All systems go! OpenClaw is running."