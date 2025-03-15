CREATE OR REPLACE PROCEDURE add_transaction(
    p_sender IN VARCHAR2,
    p_receiver IN VARCHAR2,
    p_amount IN NUMBER
) AS
    v_previous_hash VARCHAR2(64);
    v_transaction_string VARCHAR2(4000);
    v_new_hash VARCHAR2(64);
BEGIN
    -- Get the last block’s hash
    SELECT current_hash INTO v_previous_hash
    FROM blockchain_ledger
    ORDER BY transaction_id DESC FETCH FIRST 1 ROW ONLY;

    -- Create a hash input string
    v_transaction_string := p_sender || p_receiver || p_amount || SYSTIMESTAMP || v_previous_hash;

    -- Generate a new hash
    v_new_hash := generate_hash(v_transaction_string);

    -- Insert the transaction as a new block
    INSERT INTO blockchain_ledger (sender, receiver, amount, previous_hash, current_hash)
    VALUES (p_sender, p_receiver, p_amount, v_previous_hash, v_new_hash);

    COMMIT;
END add_transaction;
/