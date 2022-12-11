#!/bin/bash
PSQL="psql -U freecodecamp -d periodic_table -t -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # search for element
  # if input is number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # get element properties
    PROPERTIES=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
  else
    PROPERTIES=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1' or symbol='$1'")
  fi
  # if not found
  if [[ -z $PROPERTIES ]]
  then
    echo "I could not find that element in the database."
  else
    # reformat data
    FORMATTED_PROPERTIES=$(echo $PROPERTIES | sed -E 's/[|]//g')
    echo $FORMATTED_PROPERTIES | while read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
      # output message
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
  
fi
