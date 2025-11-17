#!/bin/bash

echo -n "Please enter the path to the transformer directory at tag v4.57.0: "
read -r REPOSITORY_PATH

if [ ! -d "$REPOSITORY_PATH" ]; then
    echo "Error: Directory '$REPOSITORY_PATH' does not exist!"
    return 1
fi

if [ -d "./venv" ]; then
    source "./venv/bin/activate"
    echo "Virtual environment activated"
elif [ -f "./.venv" ]; then
    source "./.venv/bin/activate"
    echo "Virtual environment activated"
else
    echo "No python venv found in the directory, please source it manually."
fi

export REPOSITORY_PATH