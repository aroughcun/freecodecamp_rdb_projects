#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Reset tables for each new run of script
# $($PQSL "TRUNCATE TABLE teams, games;")

# Read file line by line
cat games_test.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
do
if [[ $YEAR != 'year' ]] # Check for header line and only loop over non-header lines  
then
  # check if winner or opponent team exists
  TEAM_WIN=$($PSQL "SELECT name FROM teams WHERE name='$WINNER';")
  TEAM_OPP=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT';")
  # if winner not found
  if [[ -z $TEAM_WIN ]]
  then
    # add winner team
    WINNER_INSERT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
    echo Inserted winner team: $WINNER
  fi
  # if opponent not found
  if [[ -z $TEAM_OPP ]]
  then
    # add opponent team
    OPPONENT_INSERT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
    echo Inserted opponent team: $OPPONENT
  fi
  
# Games table 

# Add year to the year column
# Add round to the round column
# Get team_id from teams table corresponding to winning team name
# Get team_id from teams table corresponding to opponent team name
# Get winner goals from winner_goals column 
# Get opponent goals from opponent_goals column
fi
done
