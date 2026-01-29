#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# 1. Check if argument is missing
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# 2. Query the database
# We check atomic_number, symbol, and name in one go
QUERY_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) 
WHERE atomic_number::text = '$1' OR symbol = '$1' OR name = '$1';")

# 3. Check if element exists
if [[ -z $QUERY_RESULT ]]
then
  echo "I could not find that element in the database."
else
  # 4. Parse and format output
  echo "$QUERY_RESULT" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELT BOIL
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  done
fi