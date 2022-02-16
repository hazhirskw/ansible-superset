#!/bin/bash
usr="{{admin}}"
name="{{admin}}"
lastname="{{admin}}"
email="{{admin}}"
pass="{{adminPass}}"

cd superset
chmod a+x bin/activate
source bin/activate

#export FLASK_APP=superset
superset db upgrade
# Create admin user
superset fab create-admin --username $usr --firstname $name --lastname $lastname --email $email --password $pass


# Create default roles and permissions
superset init

gunicorn -w 1 -k gevent --timeout 120 -b  127.0.0.1:8088 --limit-request-line 0 --limit-request-field_size 0 "superset.app:create_app()"


