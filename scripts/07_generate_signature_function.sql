CREATE OR REPLACE FUNCTION generate_signature(p_transaction_id NUMBER, p_private_key VARCHAR2) RETURN VARCHAR2 IS
BEGIN
    RETURN DBMS_CRYPTO.ENCRYPT(p_transaction_id || p_private_key, DBMS_CRYPTO.ENCRYPT_AES128, UTL_RAW.CAST_TO_RAW(p_private_key));
END generate_signature;
/