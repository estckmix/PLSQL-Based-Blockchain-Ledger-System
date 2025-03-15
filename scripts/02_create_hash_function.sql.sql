CREATE OR REPLACE FUNCTION generate_hash(input_string VARCHAR2) RETURN VARCHAR2 IS
    v_hash RAW(32);
BEGIN
    v_hash := DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(input_string), DBMS_CRYPTO.HASH_SH256);
    RETURN RAWTOHEX(v_hash); -- Convert binary hash to hex format
END generate_hash;
/