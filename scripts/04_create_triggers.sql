CREATE OR REPLACE TRIGGER enforce_immutability
BEFORE UPDATE OR DELETE ON blockchain_ledger
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Blockchain records are immutable!');
END;
/