#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "truncate table teams cascade;")
cat games.csv | tail -n +2 |cut -d',' -f3,4 | tr ',' '\n'| sort -u | while read team
do 
echo $($PSQL "insert into teams(name) values('$team') on conflict(name) do nothing;")
done

echo $($PSQL "truncate table games cascade;")
cat games.csv | tail -n +2 | while IFS=',' read year round winner opponent winner_goals opponent_goals
do
winner_id=$($PSQL "select team_id from teams where name='$winner';")
opponent_id=$($PSQL "select team_id from teams where name='$opponent';")
echo $($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)")
done