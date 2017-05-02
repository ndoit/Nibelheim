# does something to the network so the host can connect to localhost
service iptables stop

# start neo4j dev server
neos

# start up redis
redis-server

# restart elasticsearch
service elasticsearch restart
