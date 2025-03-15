CREATE TABLE blockchain_ledger (
    transaction_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sender VARCHAR2(100) NOT NULL,
    receiver VARCHAR2(100) NOT NULL,
    amount NUMBER NOT NULL,
    transaction_time TIMESTAMP DEFAULT SYSTIMESTAMP,
    previous_hash VARCHAR2(64), -- Stores the hash of the previous block
    current_hash VARCHAR2(64) -- Hash of this transaction
);
