#!/bin/bash

# 1. Create temporary folder
temp_folder=$(mktemp -d)

# 2. Copy apache logs from /var/log/httpd/access_log to temporary folder
sudo cp /var/log/httpd/access_log "$temp_folder"

# 3. Copy index.html from /var/www/html to temporary folder
sudo cp /var/www/html/index.html "$temp_folder"

# 4. Create backup zip with compression
timestamp=$(date +%Y-%m-%d-%H%M%S)
backup_file="$temp_folder/backup_$timestamp.zip"
sudo zip -r "$backup_file" "$temp_folder"

# 5. Move backup zip to backup folder
backup_folder="$HOME/backup"
sudo mv "$backup_file" "$backup_folder"

echo "Backup created and moved to: $backup_folder"

# 6. Removing 30 days old files based on modification time
find "$backup_folder" -type f -iname '*.zip' -mtime +30 -delete
