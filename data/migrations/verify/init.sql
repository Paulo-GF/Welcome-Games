-- Verify welcome_games:init on pg

BEGIN;

SELECT id, name, topic, author, image, editor, minimum_age, game_time, minimum_players, maximum_players, description FROM welcome_games WHERE false;

ROLLBACK;
