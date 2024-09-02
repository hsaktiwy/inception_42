# create the adminer index.php folder
mkdir /var/www/html/adminer
# install adminer
cd  /var/www/html/adminer
wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
# gave the apache permission on our folder
chmod 744 /var/www/html/adminer
# enable adminer site
sudo a2ensite adminer.conf

# apache -D FOREGROUND