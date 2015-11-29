#!/bin/bash
source env.sh
eval $CURLBIN @host_collect.json http://localhost:3000/api/host_collect | python -m json.tool
