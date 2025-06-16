#!/bin/bash
set -e  # Exit immediately on error

CUR_DIR=$(pwd)
TARGET_DIR="$HOME"

# List of files to create symlinks for
FILES=(".gitconfig" ".local" ".tmux.conf" ".vimrc" ".vim")

echo "Starting configuration symlink setup..."
echo "Current directory: $CUR_DIR"
echo "Target directory: $TARGET_DIR"
echo

for file in "${FILES[@]}"; do
    source_path="$CUR_DIR/$file"
    target_path="$TARGET_DIR/$file"
    backup_path="$TARGET_DIR/${file}.bak"
    
    # Check if source file exists
    if [[ ! -e "$source_path" ]]; then
        echo "Warning: Source file '$source_path' does not exist, skipping"
        continue
    fi
    
    # Handle existing target files/links
    if [[ -e "$target_path" || -L "$target_path" ]]; then
        echo "Found existing file/link: $target_path"
        
        # Remove old backup if exists
        if [[ -e "$backup_path" ]]; then
            echo "  Removing old backup: $backup_path"
            rm -rf "$backup_path"
        fi
        
        # Create backup of current file
        echo "  Creating backup: $target_path -> $backup_path"
        mv -v "$target_path" "$backup_path"
    fi
    
    # Create symbolic link
    echo "Creating symlink: $source_path -> $target_path"
    ln -sv "$source_path" "$TARGET_DIR"
    echo
done

echo "All operations completed successfully!"

