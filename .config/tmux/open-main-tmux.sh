#!/bin/bash

# If tmux is not installed, not running on X11 or already inside TMUX, exit
if [ ! -x "$(command -v tmux)" ] || [ -z "${DISPLAY}" ] || [ -n "${TMUX}" ]; then
  return
fi

current_dir=$(pwd)
tmux has-session -t main

# If no session exists, create one and attach to it
if [ $? != 0 ]; then
  exec tmux new -A -s main -c $current_dir
  return
fi

attached_session=$(tmux list-sessions | grep -c "main.*(attached)")
# If we are already attached to the session somehwere else: maybe create a new window in the current directory, then focus the existing session instead
if [ $attached_session -eq 1 ]; then
  if [ $current_dir != $HOME ]; then
    tmux attach -t main \; new-window -c $current_dir \; detach
  fi
  # Run i3-msg to focus on the xfce4-terminal and exit the current shell/terminal
  i3-msg '[class="Xfce4-terminal"] focus; mark "terminal"'a
  exit 0
else
  # If we are not attached to the session already, attach to it and maybe create a new window in the current directory
  if [ $current_dir = $HOME ]; then
    exec tmux attach -t main
  else
    exec tmux attach -t main \; new-window -c $current_dir
  fi
fi
