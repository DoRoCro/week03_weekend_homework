#!/bin/bash
# Run to re-initialise databases, NB drops entire database!!!
# call this script from parent directory.
DB_NAME="cccinema"
LOG="$DB_NAME.setup.log" 

dropdb  $DB_NAME  | tee  $LOG
createdb  $DB_NAME  | tee -a $LOG

psql -d $DB_NAME -f db/cinema_tables.sql | tee -a $LOG

psql -d $DB_NAME <<EOF | tee -a  $LOG 
\l
select * from customers;
select * from films;
select * from tickets;
select * from screenings;

EOF
