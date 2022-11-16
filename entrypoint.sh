#!/bin/sh

DIR="var/www/html"
FILE="index.php"


if [ -f "$DIR"/"$FILE" ]; then
 	echo "Wordpress installation found."
	if [ -f "wordpress/latest.tar.gz" ]; then
		echo "Removing Wordpress archive..." && rm latest.tar.gz
	fi
else
	echo "No Wordpress installation found. Downloading the archive..."
 	curl -O https://wordpress.org/latest.tar.gz
 	echo "Archive downloaded... extracting contents..."
	tar -xzf latest.tar.gz
	#echo "Creating directory var/www/html"
	#mkdir -p var/www/html
	echo "Moving Wordpress..."
	mv wordpress/* var/www/html
 	echo "Removing archive and folder..."
	rm -r wordpress
 	rm latest.tar.gz
	echo "All done!"
fi

exec "$@"


