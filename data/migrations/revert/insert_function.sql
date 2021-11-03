-- Revert welcome_games:insert_function from pg

BEGIN;

DROP FUNCTION new_game;

COMMIT;
