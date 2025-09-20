#!/bin/bash

# Get the current directory
current_dir=$(pwd)

# Check if we're inside tmux
if [ -z "$TMUX" ]; then
    echo "Error: This script must be run from within a tmux session."
    exit 1
fi

# Split current window horizontally to create bottom pane (./frontend)
tmux split-window -v -p 20 -c "$current_dir/frontend"

tmux select-pane -t 0

# Split the bottom pane vertically to create ./functions/typescript pane  
tmux split-window -v -p 28 -c "$current_dir/functions/typescript"
