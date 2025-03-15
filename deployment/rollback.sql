-- rollback.sql
DROP TABLE transaction_signatures;
DROP TABLE blockchain_ledger;
DROP FUNCTION generate_hash;
DROP FUNCTION verify_blockchain;
DROP PROCEDURE add_transaction;
DROP TRIGGER enforce_immutability;
COMMIT;