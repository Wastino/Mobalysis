#!/bin/bash

# Giving root access
sudo su
# Updating packages and dependencies
apt-get update -y
# Installing Postgresql
apt install postgresql -y
sudo su postgres -y
# Creating User
create user mob_db_user with encrypted password 'mob_db_pass'
