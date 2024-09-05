#!/bin/bash

# MySQL Database credentials
DB_NAME="posey"
DB_USER="root"
DB_PASS="@#080890"
DB_HOST="localhost"
DB_PORT="3306"

# CSV Files Directory
CSV_DIR="Gold"

# Iterate over each CSV file and load it into MySQL database
for file in $CSV_DIR/*.csv; do
  table_name=$(basename "$file" .csv)
  
  # Loading data into MySQL
  echo "Loading $file into MySQL database..."
  
  # Create table query assuming the CSV file has a header row
  header=$(head -n 1 "$file" | sed 's/,/ VARCHAR(255), /g;s/$/ VARCHAR(255)/')
  
  # SQL commands to drop table if exists, create a new table, and load the data
  mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS -D $DB_NAME -e "
    DROP TABLE IF EXISTS $table_name;
    CREATE TABLE $table_name ($header);
    LOAD DATA INFILE '$(pwd)/$file' 
    INTO TABLE $table_name
    FIELDS TERMINATED BY ',' 
    ENCLOSED BY '\"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
  "
  
  if [[ $? -eq 0 ]]; then
    echo "Data from $file loaded successfully into $table_name table."
  else
    echo "Failed to load data from $file into $table_name table."
  fi
done

