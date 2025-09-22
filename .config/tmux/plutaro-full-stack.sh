#!/bin/bash

# Get the current directory
current_dir=$(pwd)

# Check if we're inside tmux
if [ -z "$TMUX" ]; then
    echo "Error: This script must be run from within a tmux session."
    exit 1
fi

# Split current window horizontally to create bottom pane (./frontend)
# run the command VITE_USE_LOCAL_FUNCTIONS=true pnpm run dev in the pane
tmux split-window -v -p 20 -c "$current_dir/frontend" "VITE_USE_LOCAL_FUNCTIONS=true pnpm run dev"

tmux select-pane -t 0

# Split the bottom pane vertically to create ./functions/typescript pane  
tmux split-window -v -p 28 -c "$current_dir/functions/typescript" "pnpm run build:watch"

tmux select-pane -t 0

firebase emulators:start --only functions
