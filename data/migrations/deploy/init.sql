-- Deploy welcome_games:init to pg

BEGIN;

CREATE DOMAIN positiveint AS int CHECK(VALUE > 0);


CREATE TABLE welcome_games (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    topic TEXT NOT NULL UNIQUE,
    author TEXT NOT NULL,
    image TEXT NOT NULL,
    editor TEXT NOT NULL,
    minimum_age positiveint NOT NULL,
    game_time INTERVAL NOT NULL,
    minimum_players positiveint NOT NULL,
    maximum_players positiveint NOT NULL,
    description TEXT NOT NULL,
    CHECK(maximum_players >= minimum_players)
);

COMMIT;
