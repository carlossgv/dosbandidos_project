#!/bin/bash

SESSION="Dos Bandidos"
SESSIONEXISTS=$(tmux list-sessions | grep "$SESSION")

if [ "$SESSIONEXISTS" = "" ]
then

  tmux new-session -d -s "$SESSION"

  tmux rename-window -t 0 'Main'
  tmux send-keys -t 'Main' 'cd ~/projects/dosbandidos_project' C-m
  tmux send-keys -t 'Main' 'source ~/projects/dosbandidos_project/venv/bin/activate' C-m
  tmux send-keys -t 'Main' 'tmux source ~/.config/tmux/tmux.conf' C-m
  tmux send-keys -t 'Main' 'clear' C-m
  tmux splitw -h

  tmux send-keys -t 'Main' 'python3 manage.py runserver' C-m


fi

tmux attach-se

