#!/bin/bash
usr="ADMIN"
name="ADMIN"
lastname="ADMIN"
email="ADMIN"
pass="passwd"

cd superset
chmod a+x bin/activate
source bin/activate

#export FLASK_APP=superset
superset db upgrade
# Create admin user
superset fab create-admin --username $usr --firstname $name --lastname $lastname --email $email --password $pass


# Create default roles and permissions
superset init

# To start a development web server on port 8088, use -p to bind to another port
#nohup superset run --host 0.0.0.0 -p 8088 --with-threads --reload --debugger > server.log &
gunicorn -w 1 -k gevent --timeout 120 -b  0.0.0.0:8088 --limit-request-line 0 --limit-request-field_size 0 "superset.app:create_app()"


