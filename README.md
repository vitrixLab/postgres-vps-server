# postgres‑vps‑server

A tiny Docker‑Compose setup that runs PostgreSQL 15 on any host (VPS, laptop, CI).

## Quick start

```bash
# 1️⃣ Copy the example env and edit the password
cp .env.example .env   # (or edit the .env you just created)

# 2️⃣ Bring the DB up
docker compose up -d

# 3️⃣ Connect from the host
PGPASSWORD=$POSTGRES_PASSWORD psql -h 127.0.0.1 -U $POSTGRES_USER -d $POSTGRES_DB -c "SELECT version();"

