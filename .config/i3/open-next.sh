#!/bin/bash
# requires jq

# Get the current workspace
NEXT_AVAILABLE_WORKSPACE=$(echo $(i3-msg -t get_workspaces | jq '.[] | .num' | sort -n) | awk '{for(i=1;i<=NF+1;i++)if($i!=i){print i;exit}}')

i3-msg workspace $NEXT_AVAILABLE_WORKSPACE;