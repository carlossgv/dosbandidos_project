#!/bin/bash

SESSION="Dos Bandidos"
SESSIONEXISTS=$(tmux list-sessions | grep -w "$SESSION")

if [ "$SESSIONEXISTS" = "" ]
then

  tmux new-session -d -s "$SESSION" -d -x "$(tput cols)" -y "$(tput lines)"

  tmux rename-window -t 0 'Main'
  tmux send-keys -t 'Main' 'cd ~/projects/dosbandidos_project' C-m
  tmux send-keys -t 'Main' 'source dosbandidos_env/bin/activate' C-m
  tmux send-keys -t 'Main' 'code .' C-m
  tmux send-keys -t 'Main' 'clear' C-m
  tmux splitw -h -p 30

  tmux send-keys -t 'Main' 'python3 manage.py runserver' C-m
  tmux select-pane -t 0

fi

tmux attach-session -t "$SESSION":0

