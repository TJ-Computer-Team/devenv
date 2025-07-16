#!/bin/bash

if [ "$1" == "reset" ]; then
    echo "Resetting Docker containers and volumes..."
    cd config || exit 1
    sudo docker compose down -v
    cd ..
    rm -rf autograder2/.first_log
else
    git submodule update --init --recursive

    cd config || exit 1
    sudo docker compose up --build
fi


