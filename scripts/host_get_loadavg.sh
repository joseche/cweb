#!/bin/bash
source env.sh
eval $CURLBIN @host_settags.json http://localhost:3000/api/host_gettags | python -m json.tool

curl -v -s  -X GET -H "Content-Type: application/json" -H "Authentication: c804190ce588faefae423bbda1ae3926" http://localhost:3000/api/host/418999e6c7ab81404ba824e5bcdf6afd/loadavg/12h

