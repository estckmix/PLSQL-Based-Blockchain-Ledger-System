CREATE OR REPLACE FUNCTION verify_signature(p_transaction_id NUMBER, p_user_signature VARCHAR2, p_public_key VARCHAR2) RETURN VARCHAR2 IS
    v_decrypted_value VARCHAR2(4000);
BEGIN
    v_decrypted_value := DBMS_CRYPTO.DECRYPT(UTL_RAW.CAST_TO_RAW(p_user_signature), DBMS_CRYPTO.ENCRYPT_AES128, UTL_RAW.CAST_TO_RAW(p_public_key));

    IF v_decrypted_value = p_transaction_id || p_public_key THEN
        RETURN 'Signature Valid';
    ELSE
        RETURN 'Signature Invalid';
    END IF;
END verify_signature;
/