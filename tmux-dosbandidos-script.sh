#!/bin/bash

SESSION="dos-bandidos"
SESSIONEXISTS=$(tmux list-sessions | grep -w "$SESSION")

if [ "$SESSIONEXISTS" = "" ]
then

  tmux new-session -d -s "$SESSION" -d -x "$(tput cols)" -y "$(tput lines)"

  tmux rename-window -t 1 'Main'
  tmux splitw -h -p 30
  tmux send-keys -t 'Main' 'cd ~/projects/dosbandidos_project' C-m
  tmux send-keys -t 'Main' 'source ./envdosbandidos/bin/activate' C-m
  tmux send-keys -t 'Main' 'code .' C-m
  tmux send-keys -t 'Main' 'clear' C-m
  tmux send-keys -t 'Main' 'python3 manage.py runserver 0.0.0.0:8000' C-m

  tmux select-pane -t 0

fi

tmux attach-session -t "$SESSION":1

