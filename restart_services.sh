# does something to the network so the host can connect to localhost
service iptables stop

# # start neo4j dev server
# neos

# restart elasticsearch
service elasticsearch restart

# start up redis
redis-server /etc/redis.conf
