CREATE OR REPLACE FUNCTION verify_blockchain RETURN VARCHAR2 IS
    v_previous_hash VARCHAR2(64);
    v_computed_hash VARCHAR2(64);
    v_transaction_string VARCHAR2(4000);
BEGIN
    FOR block IN (SELECT * FROM blockchain_ledger ORDER BY transaction_id) LOOP
        -- Skip Genesis block
        IF block.transaction_id > 1 THEN
            -- Recompute the hash
            v_transaction_string := block.sender || block.receiver || block.amount || block.transaction_time || block.previous_hash;
            v_computed_hash := generate_hash(v_transaction_string);

            -- Compare stored hash with computed hash
            IF v_computed_hash != block.current_hash THEN
                RETURN 'Blockchain integrity compromised at Transaction ID: ' || block.transaction_id;
            END IF;
        END IF;

        -- Set previous hash for next iteration
        v_previous_hash := block.current_hash;
    END LOOP;
    
    RETURN 'Blockchain is valid.';
END verify_blockchain;
/
