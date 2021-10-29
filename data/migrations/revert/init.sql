-- Revert welcome_games:init from pg

BEGIN;

DROP TABLE welcome_games;

COMMIT;
