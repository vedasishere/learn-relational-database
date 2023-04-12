#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER_RANDOM=$(($RANDOM % 1000 + 1))

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "insert into users(name) values('$USERNAME')")
else
  GAMES_PLAYED=$($PSQL "select count(*) from games where user_id=$USER_ID")
  BEST_GAME=$($PSQL "select min(guess) from games where user_Id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS_NUMBER
TRIES=1

while [[ $GUESS_NUMBER != $NUMBER_RANDOM ]]
do
  TRIES=$(($TRIES+1))
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS_NUMBER -gt $NUMBER_RANDOM ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS_NUMBER -lt $NUMBER_RANDOM ]]
  then
    echo "It's higher than that, guess again:"
  fi
  read GUESS_NUMBER
done

if [[ -z $USER_ID ]]
then
  USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
fi
INSERT_GAME=$($PSQL "insert into games(user_id, guess) values($USER_ID, $TRIES)")
echo "You guessed it in $TRIES tries. The secret number was $GUESS_NUMBER. Nice job!"
