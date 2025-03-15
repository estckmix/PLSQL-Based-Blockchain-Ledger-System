-- Sample Transactions for Blockchain Ledger
-- Assumes the existence of a generate_hash function and blockchain_ledger table

INSERT INTO blockchain_ledger (sender, receiver, amount, previous_hash, current_hash)
VALUES ('Alice', 'Bob', 50, (SELECT current_hash FROM blockchain_ledger WHERE transaction_id = (SELECT MAX(transaction_id) FROM blockchain_ledger)), generate_hash('Alice|Bob|50'));

INSERT INTO blockchain_ledger (sender, receiver, amount, previous_hash, current_hash)
VALUES ('Bob', 'Charlie', 30, (SELECT current_hash FROM blockchain_ledger WHERE transaction_id = (SELECT MAX(transaction_id) FROM blockchain_ledger)), generate_hash('Bob|Charlie|30'));

INSERT INTO blockchain_ledger (sender, receiver, amount, previous_hash, current_hash)
VALUES ('Charlie', 'Dave', 75, (SELECT current_hash FROM blockchain_ledger WHERE transaction_id = (SELECT MAX(transaction_id) FROM blockchain_ledger)), generate_hash('Charlie|Dave|75'));

INSERT INTO blockchain_ledger (sender, receiver, amount, previous_hash, current_hash)
VALUES ('Dave', 'Eve', 40, (SELECT current_hash FROM blockchain_ledger WHERE transaction_id = (SELECT MAX(transaction_id) FROM blockchain_ledger)), generate_hash('Dave|Eve|40'));

INSERT INTO blockchain_ledger (sender, receiver, amount, previous_hash, current_hash)
VALUES ('Eve', 'Alice', 20, (SELECT current_hash FROM blockchain_ledger WHERE transaction_id = (SELECT MAX(transaction_id) FROM blockchain_ledger)), generate_hash('Eve|Alice|20'));

COMMIT;