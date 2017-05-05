echo ===========================================================================
echo Start Neo4j Dev server
echo ===========================================================================

/usr/local/share/neo4j-community-3.0.9/bin/neo4j start

echo ===========================================================================
echo Restart Elasticsearch
echo ===========================================================================

service elasticsearch restart

echo ===========================================================================
echo Start up redis in the background
echo ===========================================================================

redis-server /etc/redis.conf

echo ===========================================================================
echo Killing extraneous processes...
echo ===========================================================================

/etc/init.d/iptables stop
kill -9 $(cat /tmp/pid/unicorn.pid)
service nginx stop

echo ===========================================================================
echo Preparing nginx...
echo ===========================================================================

cp /vagrant/fenrir/config/fenrir_nginx_conf /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/fenrir_nginx_conf /etc/nginx/sites-enabled/

echo ===========================================================================
echo Bundling and starting Unicorn
echo ===========================================================================

# cd /vagrant/fenrir/ && bundle &&
# bundle exec unicorn -c /vagrant/fenrir/config/unicorn.rb -D

echo ===========================================================================
echo Starting nginx
echo ===========================================================================

# service nginx start
