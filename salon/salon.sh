#!/bin/bash

echo -e "\n~~ My Salon ~~\n"

PSQL=" psql --username=freecodecamp --dbname=salon -t --no-align -c"
MAIN_MENU(){
  if [[ $1 ]]
  then
      echo -e "\n$1"
  fi
  echo "Hello dear Customer"

  #Displaying Services
  echo "We offer the following services, please select one option"
  services=$($PSQL "select service_id, name from services;")
  echo "$services" | while IFS="|" read id name
  do
  echo "$id) $name"
  done

  #Read service_id
  read SERVICE_ID_SELECTED
  #Checking service
  services_availability=$($PSQL "select service_id from services where service_id = $SERVICE_ID_SELECTED;")

  if [[ -z $services_availability ]]
   then
      #Send to Main menu
      MAIN_MENU "I was not able to find the service"
   else
      #get customer phone number
      echo -e "\nWhat's your Phone Number?"
      read CUSTOMER_PHONE
    
   CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE';")

  if [[ -z $CUSTOMER_NAME ]]
   then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      #Inserting customer info
      inserting_new_customer=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
  fi
  #fetch customer_id
  customer_id=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE';")
  #fetch service_name
  SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED;")

  #Get appointment time
  echo -e "\nWhat time would you like to sehdule your appointment?"
  read SERVICE_TIME

  #Inserting appointment
  insert_appointment=$($PSQL "insert into appointments(customer_id, service_id, time) values($customer_id, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

  #final output
  SERVICE_FORMATTED=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')
  NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')

  echo -e "\nI have put you down for a $SERVICE_FORMATTED at $SERVICE_TIME, $NAME_FORMATTED."
fi
}

MAIN_MENU
