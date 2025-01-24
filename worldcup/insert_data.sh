#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER LOSER WGOALS LGOALS
do
  #ignore first line
  if [[ $YEAR != "year" ]]
    then
      #get w id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      #if not found
      if [[ -z $WINNER_ID ]]
        then
          #insert team
          echo "$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")"
          #get w id
          WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      fi
      
      #get l id
      LOSER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$LOSER'")
      #if not found
      if [[ -z $LOSER_ID ]]
        then
          #insert team
          echo "$($PSQL "INSERT INTO teams(name) VALUES ('$LOSER')")"
          #get l id
          LOSER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$LOSER'")
      fi

      #insert game
      echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $LOSER_ID, $WGOALS, $LGOALS)")"
  fi
  
done