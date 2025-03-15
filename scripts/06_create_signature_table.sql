CREATE TABLE transaction_signatures (
    transaction_id NUMBER REFERENCES blockchain_ledger(transaction_id),
    user_signature VARCHAR2(4000),
    CONSTRAINT pk_signature PRIMARY KEY (transaction_id)
);