#!/bin/bash

if [[ -n "$1" ]]; then
  if [[ "$1" == "logout" ]]; then
    xfce4-session-logout --logout --fast
  elif [[ "$1" == "suspend" ]]; then
    xfce4-session-logout --suspend --fast
  elif [[ "$1" == "reboot" ]]; then
    xfce4-session-logout --reboot --fast
  elif [[ "$1" == "hibernate" ]]; then
    xfce4-session-logout --hibernate --fast
  elif [[ "$1" == "shutdown" ]]; then
    shutdown now
  fi
  exit
fi

echo "shutdown"
echo "suspend"
echo "reboot"
echo "hibernate"
echo "logout"
echo "cancel"