#!/bin/sh

./manage.py loaddata ./accounting/fixtures/Supplier.json
./manage.py loaddata ./accounting/fixtures/Rule.json
./manage.py loaddata ./accounting/fixtures/User.json
./manage.py loaddata ./accounting/fixtures/Expense.json
./manage.py loaddata ./accounting/fixtures/Income.json
./manage.py loaddata ./accounting/fixtures/Cashlog.json
./manage.py loaddata ./accounting/fixtures/Metric.json