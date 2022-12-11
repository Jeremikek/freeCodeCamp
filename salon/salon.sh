#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ -z $1 ]]
  then
    echo -e "Welcome to My Salon, how can I help you?\n"
  else
    echo -e "\n$1"
  fi

  echo "$($PSQL "SELECT * FROM services")" | while read SERVICE_ID BAR SERVICE_NAME
  do
    if [[ $SERVICE_ID != "service_id" ]]
    then
      # print service list
      echo "$SERVICE_ID) $SERVICE_NAME"
    fi
  done
  # read service
  read SERVICE_ID_SELECTED
  # if not found
  SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  if [[ -z $SERVICE_NAME_SELECTED ]]
  then
    # return main menu
    MAIN_MENU "I could not find that service. What would you like today?"
    else
    # get phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # if not found
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      # register new customer
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # insert to customers table
      CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi
    # get customer info
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # get appointment time
    SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME_SELECTED | sed -E 's/^ *| *$//g');
    CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g');
    echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
    read SERVICE_TIME
    # insert to appointment table
    APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments(service_id, time) VALUES($SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    # exit
    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED"
  fi
}

MAIN_MENU