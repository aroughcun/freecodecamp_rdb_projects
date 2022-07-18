#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

# Display list of services and accept user input
  echo "What service would you like to schedule today?"
  echo -e "1) Haircut\n2) Beard Trim\n3) Hot Shave\n4) Line Up\n5) Exit"
  read SERVICE_ID_SELECTED
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  SERVICE_FORMATTED=$(echo $SERVICE | sed -E 's/^ *| *$//g')

  case $SERVICE_ID_SELECTED in
    1) SCHEDULE ;;
    2) SCHEDULE ;;
    3) SCHEDULE ;;
    4) SCHEDULE ;;
    *) EXIT ;;
  esac
  
  # If service selected is not an option
  if [[ $SERVICE_ID_SELECTED != [1-5] ]]
  then
    # return to main menu
    MAIN_MENU "That's not a valid selection.\nPlease choose from one of the options below.\n"
  fi
}

SCHEDULE() {
  # Get phone number 
  echo -e "What is your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_PHONE_RESULT=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")
  
  # If phone not found, get name, and add to customers database
  if [[ -z $CUSTOMER_PHONE_RESULT ]]
  then
    echo -e "What is your name?"
    read CUSTOMER_NAME
    CUSTOMER_INSERT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
  fi

  # Get customer name
  CUSTOMER_NAME_RESULT=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
  CUSTOMER_NAME_RESULT_FORMATTED=$(echo $CUSTOMER_NAME_RESULT | sed -E 's/^ *| *$//g')

  # Get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")

  # Get appointment time 
  echo -e "What time would you like to schedule your appointment?"
  read SERVICE_TIME
  
  # Insert appointment
  APPOINTMENT_INSERT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  echo -e "I have put you down for a $SERVICE_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_RESULT_FORMATTED."
}

EXIT() {
  echo -e "Thank you, have a nice day!"
}

MAIN_MENU
