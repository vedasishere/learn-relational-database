#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "$1"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi
  SERVICES=$($PSQL "select * from services")
  echo "$SERVICES" | while IFS=" | " read SERVICE_ID SERVICE_NAME
  do
    # if [[ $SERVICE_ID =~ ^[0-9]+$ ]]
    # then
      echo "$SERVICE_ID) $SERVICE_NAME"
    # fi
  done
  SELECT_SERVICE
}
SELECT_SERVICE() {
  read SERVICE_ID_SELECTED
  FIND_SERVICE_ID=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED")
  echo $FIND_SERVICE_ID
  if [[ -z $FIND_SERVICE_ID ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
    fi
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}
MAIN_MENU
