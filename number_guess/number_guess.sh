#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
QUERIED_NAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
if [[ -z $QUERIED_NAME ]]
  then
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    GAMES_COUNT=$($PSQL "SELECT COUNT(*) FROM games WHERE username='$USERNAME'")
    LOWEST_ATTEMPTS=$($PSQL "SELECT MIN(attempts) FROM games WHERE username='$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $GAMES_COUNT games, and your best game took $LOWEST_ATTEMPTS guesses."
fi

echo "Guess the secret number between 1 and 1000:"
NUMBER=$(( $RANDOM % 1000 + 1 ))
ATTEMPTS=0

while [[ $GUESS -ne $NUMBER ]]
do

read GUESS

if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS -gt $NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      elif [[ $GUESS -lt $NUMBER ]]
        then
          echo "It's higher than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
fi

(( ATTEMPTS++ ))
done

INSERT_GAME=$($PSQL "INSERT INTO games (attempts, username) VALUES ($ATTEMPTS, '$USERNAME')")
echo "You guessed it in $ATTEMPTS tries. The secret number was $NUMBER. Nice job!"