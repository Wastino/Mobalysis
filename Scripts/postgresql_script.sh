#!/bin/bash

# Creating Variables required ($packages, $rfolder, $dfolder, $gitloc, $sysuser, $logfile, and $helloscript)
# $rfolder is the install directory for PostgreSQL
rfolder='/postgres'
# $packages contains the dependencies for PstgreSQL
packages=('git' 'gcc' 'tar' 'gzip' 'libreadline5' 'make' 'zlib1g' 'zlib1g-dev' 'flex' 'bison' 'perl' 'python3' 'tcl' 'gettext' 'odbc-postgresql' 'libreadline6-dev')
# $dfolder is the root directory for various types of read-only data files
dfolder='/postgres/data'
# $gitloc is the location of the PosgreSQL git repo
gitloc='git://git.postgresql.org/git/postgresql.git'
# $sysuser is the system user for running PostgreSQL
sysuser='postgres'
# $helloscript is the sql script for creating the PSQL user and creating a database.
helloscript='/home/leewalker/scripts/hello.sql'
# $logfile is the log file for this installation.
logfile='psqlinstall-log'