echo ===========================================================================
echo Restart Elasticsearch
echo ===========================================================================

sudo service elasticsearch restart

echo ===========================================================================
echo Start up redis in the background
echo ===========================================================================

sudo service redis restart

echo ===========================================================================
echo Killing extraneous processes...
echo ===========================================================================

sudo /etc/init.d/iptables stop
sudo kill -9 $(cat /tmp/pid/unicorn.pid)
sudo systemctl stop nginx.service

echo ===========================================================================
echo Preparing nginx...
echo ===========================================================================

sudo cp /vagrant/fenrir/config/fenrir_nginx_conf /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/fenrir_nginx_conf /etc/nginx/sites-enabled/

echo ===========================================================================
echo Bundling gems
echo ===========================================================================

BUNDLE_GEMFILE=/vagrant/fenrir/Gemfile bundle install

echo ===========================================================================
echo Starting Unicorn
echo ===========================================================================

BUNDLE_GEMFILE=/vagrant/fenrir/Gemfile bundle exec unicorn -c /vagrant/fenrir/config/unicorn.rb -D

echo ===========================================================================
echo Starting nginx
echo ===========================================================================

sudo systemctl start nginx.service
