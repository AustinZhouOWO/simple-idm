# sqlc installation

    go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest

# Testing commands

    curl -i -X POST localhost:4000/api/users -d '{"email": "test@example.com"}' -H "Content-Type: application/json" 
    
    curl -i localhost:4000/api/users

# Create database

    CREATE Role idm WITH PASSWORD 'pwd';
    CREATE DATABASE idm_db ENCODING 'UTF8' OWNER idm;
    GRANT ALL PRIVILEGES ON DATABASE idm_db TO idm;
    ALTER ROLE idm WITH LOGIN;
    
# Run Migraion

    make migrate-up-idm
     
# Fix Database

    ALTER TABLE users OWNER TO idm;
   
   
# Insert users record (hashed password)

    CREATE EXTENSION IF NOT EXISTS pgcrypto;

    INSERT INTO users (username, name, password, email, created_by)
    VALUES ('admin', 'admin', convert_to(crypt('pwd', gen_salt('bf')), 'UTF8'), 'admin@example.com', 'system');

# Insert roles record

    INSERT INTO roles (role_name, description)
    VALUES ('admin', 'Administrator with full access');
     
# Insert user_roles record

    select * from users;
    select * from roles;
    INSERT INTO user_roles (user_uuid, role_uuid)
    VALUES ('user-uuid-example-1234', 'role-uuid-example-5678');
    
    
# API Test Commands

## Create User

    curl -i -X POST localhost:4000/api/v4/user  --data '{"name":"xyz", "email": "abc"}'  --header "Content-Type: application/json"


## Login

    curl -i -X POST localhost:4000/login  --data '{"username":"admin", "password": "pwd"}'  --header "Content-Type: application/json"

    