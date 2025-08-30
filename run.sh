#!/bin/bash
set -e

if [ "$1" == "reset" ]; then
    echo "Resetting Docker containers and volumes..."
    sudo docker compose down -v
    rm -rf autograder2/dev/.first_log
else
    tmux kill-session -t autograder || true
    tmux new-session -d -s autograder -n main
    tmux send-keys -t autograder:0 'docker compose build && docker compose up' C-m
    tmux split-window -h -t autograder:0
    tmux send-keys -t autograder:0.1 'cd autograder2/frontend && npm run dev' C-m
fi


