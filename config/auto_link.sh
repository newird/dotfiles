#!/bin/bash

# Iterate through all directories in the current directory
for dir in */; do
    # Trim the trailing slash to get the directory name
    config_name=${dir%/}

    # Check if a link or directory with the same name already exists in ~/.config
    if [ -e ~/.config/$config_name ]; then
        echo "Removing existing ~/.config/$config_name..."
        rm -rf ~/.config/$config_name
    fi

    # Create a symbolic link in ~/.config
    ln -s "$(pwd)/$config_name" ~/.config/$config_name
    echo "Link created for $config_name"
done

