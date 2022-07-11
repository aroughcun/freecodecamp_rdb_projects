#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Reset tables for each new run of script
# $($PQSL "TRUNCATE TABLES teams, games;")

# Read file line by line
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
do
if [[ $YEAR != 'year' ]] # Check for header line and only loop over non-header lines  
then 
# Teams table 

# Add each unique team (24 rows)


# Games table 

# Add year to the year column
# Add round to the round column
# Get team_id from teams table corresponding to winning team name
# Get team_id from teams table corresponding to opponent team name
# Get winner goals from winner_goals column 
# Get opponent goals from opponent_goals column
fi
done
