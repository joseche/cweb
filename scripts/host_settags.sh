#!/bin/sh
source env.sh
eval $CURLBIN @host_settags.json http://localhost:3000/api/host_settags | python -m json.tool

