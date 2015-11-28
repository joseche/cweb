#!/bin/sh
source env.sh
eval $CURLPUT @host_register.json http://localhost:3000/api/host_register | python -m json.tool
