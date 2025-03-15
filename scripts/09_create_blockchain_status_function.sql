CREATE OR REPLACE FUNCTION get_blockchain_status RETURN VARCHAR2 IS
BEGIN
    RETURN verify_blockchain;
END get_blockchain_status;
/