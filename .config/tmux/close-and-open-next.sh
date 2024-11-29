#!/bin/bash

current_session=$(tmux display-message -p '#S');

# If no session exists, create one and attach to it
if [[ $current_session == "main" ]]; then
  tmux kill-session;
else
  tmux switch-client -t main; 
  tmux kill-session -t $current_session;
fi