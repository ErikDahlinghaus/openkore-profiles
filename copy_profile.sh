#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <source_directory>"
  exit 1
fi

# Get the source directory path
source_dir="$1"

# Get the directory name from the source directory path
dir_name=$(basename "$source_dir")

# Get the directory path of the script
script_dir=$(dirname "$(realpath "$0")")

# Copy the files to the script directory
cp -R "$source_dir"/* "$script_dir/$dir_name/"

# Path to the control.txt file
config_file="$script_dir/$dir_name/config.txt"

# Search pattern to remove lines
search_pattern="username\|password\|twitch\|adminPassword"

# Remove lines matching the search pattern from the config.txt file
sed -i "/$search_pattern/d" "$config_file"