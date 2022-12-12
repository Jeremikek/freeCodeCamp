#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate secret number
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ));
echo $SECRET_NUMBER

# set initial guess count
NUMBER_OF_GUESSES=0

# function for guessing
GUESS(){
  if [[ $1 ]]
  then
  echo -e "\n$1"
  fi
  read USER_GUESS
  # if user's guesses is not number
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    GUESS "That is not an integer, guess again:"
  fi
  NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES+1 ))
}

echo -e '\nEnter your username:'
read USERNAME

# fetch user data
USER_INFO=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")

# if not found
if [[ -z $USER_INFO ]]
then
  # print welcome message
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  # insert into database
  INSERT_RESULT=$($PSQL "INSERT INTO users(username) values('$USERNAME')")
else
  FORMATTED_USER_INFO=$(echo $USER_INFO | sed -E "s/[|]/ /g")
  echo $FORMATTED_USER_INFO | while read USER_ID USERNAME GAMES_PLAYED BEST_GAME
  do
    # print welcome message
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# get user's guesses
echo -e "\nGuess the secret number between 1 and 1000:"
GUESS
while (( $USER_GUESS != $SECRET_NUMBER ))
do
  # if lower
  if (( USER_GUESS > SECRET_NUMBER ))
  then
    GUESS "It's lower than that, guess again:"
  # if higher
  elif (( USER_GUESS < SECRET_NUMBER ))
  then
    GUESS "It's higher than that, guess again:"
  fi
done

# check best game
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
if [[ BEST_GAME -eq "" || NUMBER_OF_GUESSES -lt BEST_GAME ]]
then
  BEST_GAME=$NUMBER_OF_GUESSES
fi

# update database
UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=games_played+1, best_game=$BEST_GAME where username='$USERNAME'")

# output message
echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"