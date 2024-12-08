#!/bin/bash

readonly EXEC_FILENAME="ZED_Explorer"
# Find the location of ZED_Explorer in /usr/local/zed/tools/ or /usr/share/zed/tools/
explorer_path=$(find /usr/{local,share}/zed/tools/ -name $EXEC_FILENAME -type f)

# Check if ZED_Explorer is installed
if [ -z "$explorer_path" ]; then
    echo "ZED_Explorer is not installed"
else
    # Launch ZED_Explorer
    echo "Found the '$EXEC_FILENAME' at '$explorer_path'"
    $explorer_path
fi
