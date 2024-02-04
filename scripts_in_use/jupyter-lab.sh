#!/bin/bash
set -u
#jupyter lab with c kernel from venv called 'pymain' which contains all the kernels

# Define the path to your virtual environment
 venv_path="/home/$USER/venv/pymain"

# Activate the virtual environment
 source "$venv_path/bin/activate"

# Launch your application
 jupyter-lab

# Deactivate the virtual environment when done
 deactivate
