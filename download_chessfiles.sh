#!/bin/bash

# Generate a unique session ID
SESSION_ID=$(date +%Y%m%d%H%M%S)_$$

# Create the log file name with the session ID
LOG_FILE="log_files_${SESSION_ID}.txt"

# Read input files from input_files.txt
while read line; do

  # Download the chess file using wget
  wget -O "${line}" "https://database.lichess.org/standard/${line}"

  # Check if the download was successful
  if [ $? -eq 0 ]; then
    echo "Download of '${line}' successful at $(date +%Y-%m-%d %H:%M:%S)" >> "${LOG_FILE}"
  else
    echo "Download of '${line}' failed at $(date +%Y-%m-%d %H:%M:%S)" >> "${LOG_FILE}"
  fi
done < input_files.txt
