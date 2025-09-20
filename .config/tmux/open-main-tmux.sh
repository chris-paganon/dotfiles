#!/bin/bash

# Set WITH_TMUX variable to enable tmux auto-start
if [[ -z "${WITH_TMUX}" ]] {
  return
}

# If tmux is not installed, not running on X11 or already inside TMUX, exit
if [ ! -x "$(command -v tmux)" ] || [ -z "${DISPLAY}" ] || [ -n "${TMUX}" ]; then
  return
fi

current_dir=$(pwd)
session_name=$(tmux display-message -p '#S')

# If no session exists, create one and attach to it
if [[ $session_name == *"no server running"* || $session_name == *"no session"* || -z "$session_name" ]]; then
  if [[ $current_dir != $HOME ]]; then
    exec tmux new -A -s main -c $HOME \; new-window -c $current_dir
    return
  fi

  exec tmux new -A -s main
  return
fi

attached_session=$(tmux list-sessions | grep -c "(attached)")
# If we are already attached to the session somehwere else: maybe create a new window in the current directory, then focus the existing session instead
if [ $attached_session -eq 1 ]; then
  if [ $current_dir != $HOME ]; then
    # get the session name
    tmux new-window -t $session_name -c $current_dir
  fi
  # Run i3-msg to focus on the xfce4-terminal and exit the current shell/terminal
  i3-msg '[class="Xfce4-terminal"] focus; mark "terminal"'
  exit 0
else
  # If we are not attached to the session already, attach to the most recent one and maybe create a new window in the current directory
  if [ $current_dir = $HOME ]; then
    exec tmux attach
  else
    exec tmux attach \; new-window -c $current_dir
  fi
fi
