-- Deploy metadata-db:appschema to pg

BEGIN;

CREATE EXTENSION "pgcrypto";

CREATE TYPE "reaction_type" AS ENUM (
  'like',
  'dislike',
  'custom'
);

CREATE TYPE "role_type" AS ENUM (
  'standard',
  'admin'
);

CREATE TABLE "follows" (
  "following_user_id" integer,
  "followed_user_id" integer,
  "created_at" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "password" varchar,
  "email" varchar,
  "birth_date" timestamp,
  "role" role_type,
  "created_at" timestamp
);

CREATE TABLE "friend_requests" (
  "id" integer PRIMARY KEY,
  "friend_user_requester" integer,
  "friend_user_requested" integer,
  "accepted" bool,
  "rejected" bool,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "friends" (
  "user_id_1" integer,
  "user_id_2" integer
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "body" text,
  "user_id" integer,
  "status" varchar,
  "created_at" timestamp,
  "edited_at" timestamp
);

CREATE TABLE "reactions" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "post_id" integer,
  "type" reaction_type
);

CREATE TABLE "player_pools" (
  "id" integer PRIMARY KEY,
  "user_id" integer
);

CREATE TABLE "matches" (
  "id" integer PRIMARY KEY,
  "player_pool_id" integer,
  "started_at" timestamp,
  "finished_at" timestamp
);

CREATE TABLE "match_questions" (
  "match_id" integer,
  "question" text,
  "answer" text
);

CREATE TABLE "match_histories" (
  "id" integer PRIMARY KEY,
  "match_id" integer,
  "match_data" jsonb
);

COMMENT ON COLUMN "posts"."body" IS 'Content of the post';

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("following_user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("followed_user_id") REFERENCES "users" ("id");

ALTER TABLE "player_pools" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "reactions" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "reactions" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("player_pool_id") REFERENCES "player_pools" ("id");

ALTER TABLE "match_questions" ADD FOREIGN KEY ("match_id") REFERENCES "matches" ("id");

ALTER TABLE "match_histories" ADD FOREIGN KEY ("match_id") REFERENCES "matches" ("id");

ALTER TABLE "friend_requests" ADD FOREIGN KEY ("friend_user_requester") REFERENCES "users" ("id");

ALTER TABLE "friend_requests" ADD FOREIGN KEY ("friend_user_requested") REFERENCES "users" ("id");

ALTER TABLE "friends" ADD FOREIGN KEY ("user_id_1") REFERENCES "users" ("id");

ALTER TABLE "friends" ADD FOREIGN KEY ("user_id_2") REFERENCES "users" ("id");

COMMIT;
