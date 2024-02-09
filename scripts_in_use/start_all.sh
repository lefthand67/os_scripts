#! /bin/bash/

# Function to create a new tab and execute a command
create_tab() {
    # Simulate Ctrl+Shift+T to create a new tab
    xdotool key ctrl+shift+t
    # Wait briefly for the new tab to open
    sleep 0.5
    # Type the command and press Enter
    xdotool type --delay 50 "$1"
    xdotool key Return
}

create_tab "clementine"
create_tab "source $HOME/jupyter-lab.sh"
create_tab "yandex-browser"
