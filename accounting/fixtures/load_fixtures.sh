#!/bin/sh

../../manage.py loaddata ./Supplier.json
../../manage.py loaddata ./Rule.json
../../manage.py loaddata ./User.json
../../manage.py loaddata ./Expense.json
../../manage.py loaddata ./Income.json
../../manage.py loaddata ./Cashlog.json
../../manage.py loaddata ./Metric.json