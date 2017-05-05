echo ===========================================================================
echo Start Neo4j Dev server
echo ===========================================================================

sudo /usr/local/share/neo4j-community-3.0.9/bin/neo4j start

echo ===========================================================================
echo Restart Elasticsearch
echo ===========================================================================

sudo service elasticsearch restart

echo ===========================================================================
echo Start up redis in the background
echo ===========================================================================

sudo redis-server /etc/redis.conf

echo ===========================================================================
echo Killing extraneous processes...
echo ===========================================================================

sudo /etc/init.d/iptables stop
sudo kill -9 $(cat /tmp/pid/unicorn.pid)
sudo service nginx stop

echo ===========================================================================
echo Preparing nginx...
echo ===========================================================================

sudo cp /vagrant/fenrir/config/fenrir_nginx_conf /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/fenrir_nginx_conf /etc/nginx/sites-enabled/

echo ===========================================================================
echo Bundling and Starting Unicorn
echo ===========================================================================

BUNDLE_GEMFILE=/vagrant/fenrir/Gemfile bundle install
BUNDLE_GEMFILE=/vagrant/fenrir/Gemfile bundle exec unicorn -c /vagrant/fenrir/config/unicorn.rb -D

echo ===========================================================================
echo Starting nginx
echo ===========================================================================

sudo service nginx start
