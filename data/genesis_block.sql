INSERT INTO blockchain_ledger (sender, receiver, amount, previous_hash, current_hash)
VALUES ('System', 'Genesis', 0, NULL, generate_hash('Genesis Block'));
COMMIT;
