CREATE TABLE user_roles (
    user_uuid UUID NOT NULL REFERENCES users(uuid),
    role_uuid UUID NOT NULL REFERENCES roles(uuid),
    PRIMARY KEY (user_uuid, role_uuid)
);