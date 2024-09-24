#!/usr/bin/env bash
airflow resetdb
airflow db init
airflow upgradedb
airflow users create -r Admin -u airflow -e sameremadharb213@gmail.com -f airflow -l airflow -p test1234
airflow scheduler &
airflow webserver 