# CDE_Linux-Git

## Overview

This repository contains the scripts and SQL queries used in managing and processing data for CoreDataEngineers. The tasks include an ETL process, moving files, loading data into PostgreSQL, and answering business-related queries using SQL.

### Directory Structure

- **Scripts**
  - **bash**: Contains all Bash scripts for the ETL process, moving files, and loading data into PostgreSQL.
  - **sql**: Contains SQL scripts for answering the business questions posed by the manager.

### Requirements

- Linux OS
- PostgreSQL
- curl, awk, cron for Bash scripting

### ETL Pipeline

The ETL process extracts data from a CSV file, performs a simple transformation, and loads the data into a designated folder.
