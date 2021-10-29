-- Deploy welcome_games:insert_function to pg

BEGIN;

CREATE OR REPLACE FUNCTION new_game(text,text, text, text, text, positiveint, interval, positiveint, positiveint, text) RETURNS integer AS $$

INSERT INTO public.welcome_games(
    name, topic, author, image, editor, minimum_age, game_time, minimum_players, maximum_players, description
)
VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)
RETURNING id;

$$ LANGUAGE SQL;

COMMIT;
