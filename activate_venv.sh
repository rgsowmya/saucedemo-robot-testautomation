#!/bin/bash

# Set virtual environment directory
VENV_DIR=".venv"

# Check if the virtual environment exists
if [ ! -d "$VENV_DIR" ]; then
    echo "Virtual environment not found! Run ./setup_env.sh first."
    exit 1
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source $VENV_DIR/bin/activate

echo "Virtual environment activated. Type 'deactivate' to exit."
