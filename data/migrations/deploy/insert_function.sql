-- Deploy welcome_games:insert_function to pg
BEGIN;
CREATE OR REPLACE FUNCTION new_game(text,text,text,text,text,positiveint,interval,positiveint,positiveint,text
) RETURNS integer AS $$
INSERT INTO welcome_games(
  name,topic,author,image,editor,minimum_age,game_time,minimum_players,maximum_players,description)
VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
RETURNING id;
$$ LANGUAGE SQL;
-- with a json in parameters
CREATE OR REPLACE FUNCTION new_game(json) RETURNS integer AS $$
INSERT INTO
  welcome_games(
    name,
    topic,
    author,
    image,
    editor,
    minimum_age,
    game_time,
    minimum_players,
    maximum_players,
    description
  )
VALUES
  (
    $1 ->> 'name',
    $1 ->> 'topic',
    $1 ->> 'author',
    $1 ->> 'image',
    $1 ->> 'editor',
    ($1 ->> 'minimum_age')::positiveint,
    ($1 ->> 'game_time')::interval,
    ($1 ->> 'minimum_players')::positiveint,
    ($1 ->> 'maximum_players')::positiveint,
    $1 ->> 'description'
  )
  RETURNING id;
$$ LANGUAGE SQL;
COMMIT;