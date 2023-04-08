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
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  SELECT_SERVICE
}
SELECT_SERVICE() {
  read SERVICE_ID_SELECTED
  FIND_SERVICE_ID=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $FIND_SERVICE_ID ]]
  then
    MAIN_MENU "\nI could not find that service. What would you like today?"
  else
    QUERY_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
    SERVICE_NAME=$(echo $QUERY_NAME | sed -r "s/^ *| *$//g")
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      NAME=$(echo "$CUSTOMER_NAME" | sed -r "s/^ *| *$//g")
      INSERT_CUSTOMER=$($PSQL "insert into customers(name, phone) values('$NAME', '$CUSTOMER_PHONE')")
    else
      NAME=$(echo "$CUSTOMER_NAME" | sed -r "s/^ *| *$//g")
    fi
    CUSTOMER_ID=$($PSQL "select customer_id from customers where name='$NAME'")
    echo -e "\nWhat time would you like your $SERVICE_NAME, $NAME?"
    read SERVICE_TIME
    INSERT_APPOINT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $NAME.\n"
  fi
}
MAIN_MENU
