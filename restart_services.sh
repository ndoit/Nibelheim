# does something to the network so the host can connect to localhost
service iptables stop

# start neo4j dev server
/usr/local/share/test_neo4j/bin/neo4j start

# restart elasticsearch
service elasticsearch restart

# start up redis in the background
redis-server /etc/redis.conf
