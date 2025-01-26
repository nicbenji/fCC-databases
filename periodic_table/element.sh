#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

PRINT_ELEMENT() {
  if [[ $1 ]] 
    then
      echo $1 | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME TYPE_ID ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
      do
      TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
    else
      echo "I could not find that element in the database."
      
  fi

}

if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
  else
    if [[ $1 =~ ^[0-9]+$ ]]
      then
        SELECTED_ATOMIC_NUMBER=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) WHERE atomic_number=$1")
        PRINT_ELEMENT "$SELECTED_ATOMIC_NUMBER"
      else
        SELECTED_SYMBOL=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) WHERE symbol='$1'")
        if [[ -z $SELECTED_SYMBOL ]]
          then
            SELECTED_NAME=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) WHERE name='$1'")
            PRINT_ELEMENT "$SELECTED_NAME"
          else
            PRINT_ELEMENT "$SELECTED_SYMBOL"
        fi
        
        
    fi
fi
