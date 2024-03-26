-- Revert metadata-db:appschema from pg

BEGIN;

DROP TABLE "friend_requests";
DROP TABLE "friends";
DROP TABLE "follows";
DROP TABLE "reactions";
DROP TABLE "posts";
DROP TABLE "match_questions";
DROP TABLE "match_histories";
DROP TABLE "matches";
DROP TABLE "player_pools";
DROP TABLE "users";

DROP TYPE "reaction_type";
DROP TYPE "role_type";

COMMIT;
