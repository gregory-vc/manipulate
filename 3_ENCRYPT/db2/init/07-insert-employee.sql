CREATE OR REPLACE FUNCTION add_employee(
    p_name TEXT,
    p_email TEXT,
    p_phone TEXT,
    p_position TEXT,
    p_salary TEXT
)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_key_name BYTEA := digest(p_email, 'sha256');
    v_key_material TEXT := encode(gen_random_bytes(32), 'base64');
    v_salary_encrypted BYTEA;
    v_employee_id INTEGER;
BEGIN
    UPDATE keys
       SET key_material = v_key_material,
           created_at = now()
     WHERE key_name_sha256 = v_key_name;

    IF NOT FOUND THEN
        INSERT INTO keys (key_name_sha256, key_material, created_at)
        VALUES (v_key_name, v_key_material, now());
    END IF;

    v_salary_encrypted := pgp_sym_encrypt(p_salary::text, v_key_material);

    INSERT INTO employees(name, email, phone, "position", salary)
    VALUES (p_name, p_email, p_phone, p_position, v_salary_encrypted)
    RETURNING id INTO v_employee_id;

    RETURN v_employee_id;
END;
$$;
