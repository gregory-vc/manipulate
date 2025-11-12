CREATE TABLE IF NOT EXISTS keys (
    key_name_sha256 BYTEA PRIMARY KEY,
    key_material    TEXT NOT NULL,
    created_at      TIMESTAMPTZ DEFAULT now()
);

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE keys TO user_connect;
