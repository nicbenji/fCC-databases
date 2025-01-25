#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t  --no-align -c"

echo -e "\n~~Hair Salon - Make an appointment~~\n"
#display services
SERVICE_MENU() {
  if [[ $1 ]]
    then
      echo -e "\n$1"
  fi
  echo "$($PSQL "SELECT * FROM services")" | while IFS="|" read SERVICE_ID SERVICE PRICE
  do
    echo "$SERVICE_ID) $SERVICE: $PRICE$"
  done
}

  SERVICE_MENU

  echo -e "\nPlease enter the number of the service you want to book:"
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      SERVICE_MENU "Please enter a number!"
  fi
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]
    then
      SERVICE_MENU "Please enter a number of an existing service!"
  fi
  echo -e "\nPlease enter your phone number:"
  read CUSTOMER_PHONE
  # check if customer exists
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nPlease enter your name:"
      read CUSTOMER_NAME
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  echo -e "\nPlease enter a time for your appointment:"
  read SERVICE_TIME

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  #insert appointment
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

