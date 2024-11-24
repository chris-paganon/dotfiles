#!/bin/bash

if [[ -z "$1" ]]; then
  tmuxp ls
else
  # If we are already attached to the session somehwere else: maybe create a new window in the current directory, then focus the existing session instead
  if [[ $(tmux list-sessions | grep -c "attached") -eq 1 ]]; then
    i3-msg '[class="Xfce4-terminal"] kill' >/dev/null
  fi
  
  coproc ( xfce4-terminal -e "/bin/zsh -c 'tmuxp load $1'" >/dev/null 2>&1 )
  exec 1>&-
  exit;
fi