## Set proper ID number in next entry in Database (after dumping data in DB)

- Run fix_ids_in_database script while is not done this is the manual command:
SELECT setval('accounting_income_id_seq', (SELECT MAX(id) FROM accounting_income));

