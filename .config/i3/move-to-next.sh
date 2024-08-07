# requires jq

# Get the current workspace
NEXT_AVAILABLE_WORKSPACE=$(echo $(i3-msg -t get_workspaces | jq '.[] | .num' | sort -n) | awk '{for(i=1;i<=NF+1;i++)if($i!=i){print i;exit}}')

i3-msg move container to workspace $NEXT_AVAILABLE_WORKSPACE && i3-msg workspace number $NEXT_AVAILABLE_WORKSPACE