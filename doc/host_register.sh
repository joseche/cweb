curl -s -v -X PUT -H "Content-Type: application/json" -H "Authentication: b8dabda8b5bc355c20b9127b41fe9681" --data @host_register.json http://localhost:3000/api/host_register | python -m json.tool

