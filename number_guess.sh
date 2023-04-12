#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$(($RANDOM % 1000 + 1))
echo "Enter your username:"
read USERNAME
CHECK_USER=$($PSQL "select * from users where name='$USERNAME'")
if [[ -z $CHECK_USER ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "insert into users(name) values('$USERNAME')")
  USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
  INSERT_COUNT=$($PSQL "insert into count_guess(user_id) values($USER_ID)")
else
  echo $CHECK_USER | while IFS="|" read NAME USER_ID GAMES_PLAYED BEST_GAME
  do
    RESET_GUESS=$($PSQL "update count_guess set guess=0 where user_id=$USER_ID")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
  done
fi
if [[ -z $USER_ID ]]
then
  USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
fi
UPDATE_PLAYED=$($PSQL "update users set games_played=(games_played+1) where user_id=$USER_ID")

GUESS() {
  if [[ $1 ]]
  then
    echo $1
  else
    echo "Guess the secret number between 1 and 1000:"
  fi
  read GUESS_NUMBER
  UPDATE_COUNT=$($PSQL "update count_guess set guess=(guess+1) where user_id=$USER_ID")
  if [[ $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS_NUMBER > $RANDOM_NUMBER ]]
    then
      GUESS "It's lower than that, guess again:"
    elif [[ $GUESS_NUMBER < $RANDOM_NUMBER ]]
    then
      GUESS "It's higher than that, guess again:"
    else
      NUMBER_OF_GUESS=$($PSQL "select guess from count_guess where user_id=$USER_ID")
      echo "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $GUESS_NUMBER. Nice job!"
      BEST_GUESS=$($PSQL "select best_game from users where user_id=$USER_ID")
      if [[ $BEST_GUESS > NUMBER_OF_GUESS ]] || [[ $BEST_GUESS == 0 ]]
      then
        UPDATE_BEST_GAME=$($PSQL "update users set best_game=$NUMBER_OF_GUESS where user_id=$USER_ID")
      fi
    fi
  else
    GUESS "That is not an integer, guess again:"
  fi
}

GUESS
