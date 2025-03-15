-- deploy_blockchain.sql
START scripts/01_create_tables.sql;
START scripts/02_create_functions.sql;
START scripts/03_create_procedures.sql;
START scripts/04_create_triggers.sql;
START scripts/05_create_apis.sql;
START data/genesis_block.sql;
START data/sample_transactions.sql;
COMMIT;
