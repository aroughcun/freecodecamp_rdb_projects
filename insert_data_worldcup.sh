#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Read file line by line
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
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

  # Get team_id from teams table corresponding to winner/opponent
  WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
  OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
  
  # Insert games data
  GAMES_INSERT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
  echo Inserted year: $YEAR, round: $ROUND, winner_id: $WIN_ID, opponent_id: $OPP_ID, winner_goals: $WINNER_GOALS, opponent_goals: $OPPONENT_GOALS
  
  # Insert winner_id and opponent_id into games table
  #TEAM_ID_INSERT=$($PSQL "INSERT INTO games(winner_id, opponent_id) VALUES($WIN_ID, $OPP_ID);")
  #echo Inserted winner_id: $WIN_ID and opponent_id: $OPP_ID

  # Insert goals for winners and opponents
  #GOALS_INSERT=$($PSQL "INSERT INTO games(winner_goals, opponent_goals) VALUES($WINNER_GOALS, $OPPONENT_GOALS);")
  #echo Inserted winner goals: $WINNER_GOALS and opponent goals: $OPPONENT_GOALS
fi
done
