# this script could be added into Vagrant file, but changes here only affect mysql while changes in Vagrant file affect all vagrant hosts

sudo apt-get update
sudo apt-get install -y apache2 php php-mbstring php-zip phpunit unzip libapache2-mod-php

# installation of mysql will prompt for password twice .. avoid prompting with below 2 lines    
sudo devconf-set-selections <<< 'mysql-server mysql-server/root_password password mypassword'
sudo devconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mypassword'

# install mysql and bring it up   
sudo apt-get install mysql-server, mysql-client
sudo mysql start