#!/bin/bash
# TASK 1

# Giving root access
sudo su
# Updating packages and dependencies
apt-get update -y
# Installing Postgresql
apt install postgresql -y
sudo su postgres -y
# Creating User
CREATE USER mob_db_user WITH encrypted PASSWORD 'mob_db_pass'
# TASK 6
# Creating python Venv
python3 -m venv mobalytics_venv
# Creating Postgres Database
CREATE DATABASE mobalytics;
# Assigning user to database
GRANT ALL PRIVILEGES ON DATABASE mobalytics to mob_db_user
