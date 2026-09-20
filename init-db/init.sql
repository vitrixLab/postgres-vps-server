-- This script runs only the first time the volume is empty.
-- Example: create a non‑superuser for your app and a sample table.

-- 1️⃣ Create a low‑privilege role
CREATE ROLE app_user WITH LOGIN PASSWORD 'AppPass!2026';
GRANT CONNECT ON DATABASE $POSTGRES_DB TO app_user;

-- 2️⃣ Create a schema owned by that role (optional)
CREATE SCHEMA IF NOT EXISTS app_schema AUTHORIZATION app_user;

-- 3️⃣ Example table
CREATE TABLE IF NOT EXISTS app_schema.users (
    id SERIAL PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    name TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);
