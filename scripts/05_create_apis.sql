CREATE OR REPLACE FUNCTION get_transaction_details(p_transaction_id NUMBER) RETURN CLOB IS
    v_details CLOB;
BEGIN
    SELECT JSON_OBJECT(
        'Transaction ID' VALUE transaction_id,
        'Sender' VALUE sender,
        'Receiver' VALUE receiver,
        'Amount' VALUE amount,
        'Time' VALUE transaction_time,
        'Hash' VALUE current_hash
    ) INTO v_details
    FROM blockchain_ledger
    WHERE transaction_id = p_transaction_id;

    RETURN v_details;
END get_transaction_details;
/