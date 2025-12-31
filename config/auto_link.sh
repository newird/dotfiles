#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d")

mkdir -p ~/.config

for dir in */; do
  config_name=${dir%/}

  source_path="$PWD/$config_name"
  target_path="$HOME/.config/$config_name"

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then

    current_link=$(readlink -f "$target_path")
    if [ "$current_link" == "$source_path" ]; then
      echo "[$config_name] already linked to target"
      continue
    fi

    backup_name="${target_path}.bak_${TIMESTAMP}"
    echo "found old config, backing up to: $target_path -> $backup_name"
    mv "$target_path" "$backup_name"
  fi

  ln -s "$source_path" "$target_path"
  echo "[$config_name] config success"
done

echo "all done!"
