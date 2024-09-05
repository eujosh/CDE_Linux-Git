#!/bin/bash

# Directory Variables
SOURCE_DIR="source"
DEST_DIR="json_and_CSV"

# Create destination directory if not exists
mkdir -p $DEST_DIR

# Move all CSV and JSON files to the json_and_CSV folder
mv $SOURCE_DIR/*.csv $DEST_DIR/
mv $SOURCE_DIR/*.json $DEST_DIR/

# Check if the files were successfully moved
if [[ "$(ls -A $DEST_DIR/*.csv 2>/dev/null)" ]] || [[ "$(ls -A $DEST_DIR/*.json 2>/dev/null)" ]]; then
  echo "CSV and JSON files moved successfully."
else
  echo "No CSV or JSON files to move."
fi

