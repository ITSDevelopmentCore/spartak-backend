CREATE DATABASE postgres;
CREATE USER admin WITH ENCRYPTED PASSWORD 'admin';
GRANT ALL PRIVILEGES ON DATABASE postgres TO admin;

\connect postgres

CREATE SCHEMA db-spartak;