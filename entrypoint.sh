#!/bin/sh

if [ -f "/var/www/html/index.php" ]; then
 	echo "Wordpress installation found."
else
	echo "No Wordpress installation found. Downloading the archive from wordpress.org."
 	curl -O https://wordpress.org/latest.tar.gz
 	#echo "Done" 
	echo "Extracting contents..."
	tar -xzf latest.tar.gz
	#echo "Done."
	echo "Moving files to /var/www/html..."
	mv wordpress/* /var/www/html
	#echo "Done."
 	echo "Cleaning up Wordpress archive etc..."
	rm -r wordpress
 	rm latest.tar.gz
	#echo "Done."
fi

exec "$@"


