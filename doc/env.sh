#!/bin/sh

export API_TOKEN=b8dabda8b5bc355c20b9127b41fe9681
export CURLBIN="curl -s -v -X POST -H \"Content-Type: application/json\" -H \"Authentication: $API_TOKEN\" --data "
export CURLPUT="curl -s -v -X PUT -H \"Content-Type: application/json\" -H \"Authentication: $API_TOKEN\" --data "
