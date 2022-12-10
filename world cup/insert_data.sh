#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATE=$($PSQL "truncate teams, games")
cat "games.csv" | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" && $OPPONENT != "opponent" ]]
  then
    #get winner
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
    #if not found
    if [[ -z $WINNER_ID ]]
    then
      #insert in teams
      INSERT_TEAM=$($PSQL "insert into teams(name) values('$WINNER')")
      WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
      echo inserted $WINNER
    fi
    #get opponent
    OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
    #if not found
    if [[ -z $OPPONENT_ID ]]
    then
      #insert in teams
      INSERT_TEAM=$($PSQL "insert into teams(name) values('$OPPONENT')")
      OPPONENT_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")
      echo inserted $OPPONENT
    fi

    #insert in games
    INSERT_GAMES=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo game insert
  fi
done
