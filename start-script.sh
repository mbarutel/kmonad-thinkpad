#!/bin/bash

# Define the kmonad config file path
# KMONAD_CONFIG="$HOME/.config/kmonad/your.kbd"
KMONAD_CONFIG="./my-layout.kbd"

# Function to start kmonad in the background
start_kmonad() {
    echo "Starting kmonad..."
    kmonad "$KMONAD_CONFIG" &
}

# Find existing kmonad process
PID=$(pgrep -x kmonad)

if [ -n "$PID" ]; then
    echo "kmonad is already running with PID $PID. Killing it..."
    kill "$PID"
    sleep 1  # Allow some time for it to terminate
    start_kmonad
else
    echo "kmonad is not running. Starting it..."
    start_kmonad
fi
