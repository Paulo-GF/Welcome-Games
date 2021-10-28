DROP DATABASE IF EXISTS welcome_games;

DROP ROLE IF EXISTS welcome_games;

CREATE ROLE welcome_games WITH LOGIN ENCRYPTED PASSWORD 'welcome_games';

CREATE DATABASE welcome_games WITH OWNER welcome_games;