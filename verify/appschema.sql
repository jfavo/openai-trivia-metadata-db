-- Verify metadata-db:appschema on pg

BEGIN;

-- Verify pgcrypto extension exists
SELECT EXISTS (
    SELECT 1
    FROM pg_extension
    WHERE extname = 'pgcrypto'
);

-- Verify that the tables were created
SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'follows'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'users'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'friend_requests'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'friends'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'follows'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'posts'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'reactions'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'player_pools'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'matches'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'match_questions'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_tables
    WHERE schemaname = 'public'
    AND tablename = 'match_histories'
);

-- Verify our created Enum types exist
SELECT EXISTS (
    SELECT 1
    FROM pg_type
    WHERE typname = 'reaction_type'
);

SELECT EXISTS (
    SELECT 1
    FROM pg_type
    WHERE typname = 'role_type'
);

ROLLBACK;
