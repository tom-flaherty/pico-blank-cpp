#!/usr/bin/env bash
# Uploads the .uf2 to the pico

UF2_PATH="./build/source/pico_w_project.uf2"

# Check the .uf2 is there
if ! [ -f $UF2_PATH ]; then
    echo uf2 not found
    exit
fi

upload_sucessful=false

# Use picotool if available
if which picotool >/dev/null; then
    # Flash the binary and reboot into application mode
    echo "sudo picotool load $UF2_PATH"
    sudo picotool load $UF2_PATH && \
    sudo picotool reboot && \
    upload_sucessful=true
else
    echo "Error: picotool is not installed"
    exit 1
fi

echo upload_successful=$upload_sucessful

if [ "$upload_sucessful" = true ] && [ "$1" = "m" ]; then
    echo Waiting before loading serial monitor...
    sleep 1
    bash serial_monitor.sh
fi
