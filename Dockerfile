# ---- Builder / Base image ----
FROM postgres:15-alpine

# Optional: copy an initialization script (run only on first start)
# If you don’t need any custom SQL, you can skip the next two lines.
COPY init-db/ /docker-entrypoint-initdb.d/

# Expose the default PostgreSQL port (optional – compose already maps it)
EXPOSE 5432
