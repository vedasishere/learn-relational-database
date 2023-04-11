#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  FLAG="true"
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    FIND_BY_ATOMIC_NUMBER=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number=$1")
    if [[ -z $FIND_BY_ATOMIC_NUMBER ]]
    then
      FLAG="false"
    else
      FIND=$FIND_BY_ATOMIC_NUMBER
    fi
  elif [[ $1 =~ ^[A-Z]([a-z]|[A-Z])?$ ]]
  then
    FIND_BY_SYMBOL=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where symbol='$1'")
    if [[ -z $FIND_BY_SYMBOL ]]
    then
      FLAG="false"
    else
      FIND=$FIND_BY_SYMBOL
    fi
  else
    FIND_BY_NAME=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where name='$1'")
    if [[ -z $FIND_BY_NAME ]]
    then
      FLAG="false"
    else
      FIND=$FIND_BY_NAME
    fi
  fi
  if [[ $FLAG == "true" ]]
  then
    echo $FIND | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  else
    echo "I could not find that element in the database."
  fi
fi
