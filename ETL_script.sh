#!/bin/bash

# Environment Variables
CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
RAW_DIR="raw"
TRANSFORMED_DIR="Transformed"
GOLD_DIR="Gold"
CSV_FILE_NAME="downloaded_file.csv"
TRANSFORMED_FILE_NAME="2023_year_finance.csv"

# Extract Phase
echo "Starting the ETL process..."

# Create raw directory if not exists
mkdir -p $RAW_DIR

# Download the CSV file to raw folder
echo "Downloading CSV file..."
curl -o "$RAW_DIR/$CSV_FILE_NAME" $CSV_URL

# Check if the file has been saved into the raw folder
if [[ -f "$RAW_DIR/$CSV_FILE_NAME" ]]; then
  echo "File downloaded successfully into the raw folder."
else
  echo "Failed to download the file. Exiting..."
  exit 1
fi

# Transform Phase
echo "Starting the transformation phase..."

# Create transformed directory if not exists
mkdir -p $TRANSFORMED_DIR

# Use awk to transform the data (rename and select specific columns)
awk -F',' 'NR==1 {gsub(/Variable_code/, "variable_code"); print $1","$3","$4","$5} 
NR>1 {print $1","$3","$4","$5}' "$RAW_DIR/$CSV_FILE_NAME" > "$TRANSFORMED_DIR/$TRANSFORMED_FILE_NAME"

# Check if the transformed file has been saved into the transformed folder
if [[ -f "$TRANSFORMED_DIR/$TRANSFORMED_FILE_NAME" ]]; then
  echo "Transformation successful and file saved into the transformed folder."
else
  echo "Failed to transform the file. Exiting..."
  exit 1
fi

# Load Phase
echo "Starting the load phase..."

# Create gold directory if not exists
mkdir -p $GOLD_DIR

# Move the transformed file to the gold folder
mv "$TRANSFORMED_DIR/$TRANSFORMED_FILE_NAME" "$GOLD_DIR/"

# Check if the file has been saved into the gold folder
if [[ -f "$GOLD_DIR/$TRANSFORMED_FILE_NAME" ]]; then
  echo "Load successful and file saved into the gold folder."
else
  echo "Failed to load the file. Exiting..."
  exit 1
fi

echo "ETL process completed successfully."

