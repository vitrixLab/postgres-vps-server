-- This script runs only the first time the volume is empty.
-- It creates a non‑superuser for the application.

DO $$BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'app_user') THEN
    CREATE ROLE app_user WITH LOGIN PASSWORD 'AppPass!2026';
    GRANT CONNECT ON DATABASE myapp TO app_user;
    -- Optional: give the role usage on the public schema
    GRANT USAGE ON SCHEMA public TO app_user;
    -- Optional: give SELECT/INSERT/UPDATE/DELETE on all future tables
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_user;
  END IF;
END$$;
