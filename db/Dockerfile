# Use an official PostgreSQL image as the base image
FROM postgres:latest

# Set environment variables for PostgreSQL
ENV POSTGRES_DB=mydb
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=S0me!P@sswD1

# Copy a SQL script to create sample schema and table
COPY init.sql /docker-entrypoint-initdb.d/

# Copy the backup script into the container
COPY $BACKUP_SCRIPT /usr/local/bin/
RUN chmod +x /usr/local/bin/$BACKUP_SCRIPT