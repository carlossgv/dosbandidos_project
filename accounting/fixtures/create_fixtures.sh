#!/bin/sh

./manage.py dumpdata accounting.Supplier --output ./accounting/fixtures/Supplier.json
./manage.py dumpdata accounting.Rule --output ./accounting/fixtures/Rule.json
./manage.py dumpdata auth.User --output ./accounting/fixtures/User.json
./manage.py dumpdata accounting.Expense --output ./accounting/fixtures/Expense.json
./manage.py dumpdata accounting.Income --output ./accounting/fixtures/Income.json
./manage.py dumpdata accounting.Cashlog --output ./accounting/fixtures/Cashlog.json
./manage.py dumpdata accounting.Metric --output ./accounting/fixtures/Metric.json