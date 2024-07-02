current_dir=$(pwd)
tmux has-session -t main

# If the session does not exist, create it
if [ $? != 0 ]; then
  tmux new -A -s main -c $current_dir
  exit 0
fi

attached_session=$(tmux list-sessions | grep -c "main.*(attached)")
# If we are already attached to the session somehwere else: maybe create a new window in the current directory, then focus the existing session instead
if [ $attached_session -eq 1 ]; then
  if [ $current_dir != $HOME ]; then
    tmux attach -t main \; new-window -c $current_dir \; detach
  fi
  # Run i3-msg to focus on the xfce4-terminal
  i3-msg '[class="Xfce4-terminal"] focus'
else
  if [ $current_dir = $HOME ]; then
    tmux attach -t main
  else
    tmux attach -t main \; new-window -c $current_dir
  fi
fi
