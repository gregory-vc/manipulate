CREATE OR REPLACE FUNCTION get_employees_with_salary(p_password TEXT)
RETURNS TABLE (
    id INTEGER,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    "position" VARCHAR(50),
    salary TEXT,
    created_at TIMESTAMP
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_master_hash TEXT;
BEGIN
    SELECT key_material
      INTO v_master_hash
      FROM keys
     WHERE key_name_sha256 = digest('', 'sha256');

    IF v_master_hash IS NULL THEN
        RAISE EXCEPTION 'Master key is not configured in keys table';
    END IF;

    IF crypt(coalesce(p_password, ''), v_master_hash) <> v_master_hash THEN
        RAISE EXCEPTION 'Invalid password';
    END IF;

    RETURN QUERY
    SELECT e.id,
           e.name,
           e.email,
           e.phone,
           e."position",
           pgp_sym_decrypt(e.salary, k.key_material)::text AS salary,
           e.created_at
      FROM employees e
      JOIN keys k ON k.key_name_sha256 = digest(e.email, 'sha256');
END;
$$;
