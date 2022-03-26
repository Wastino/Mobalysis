#!/bin/bash
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo su postgres 
createuser mob_app_usr