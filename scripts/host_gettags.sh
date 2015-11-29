#!/bin/bash
source env.sh
eval $CURLBIN @host_settags.json http://localhost:3000/api/host_gettags | python -m json.tool

