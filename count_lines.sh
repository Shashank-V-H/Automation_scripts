#!/bin/bash

# Check if a directory path is passed
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

TARGET_DIR="$1"

# Check if the provided path is a valid directory
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: '$TARGET_DIR' is not a valid directory."
    exit 1
fi

# Loop through files in the target directory (non-recursively)
for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        count=$(grep -cve '^\s*$' "$file")
        echo "$(basename "$file"): $count"
    fi
done
