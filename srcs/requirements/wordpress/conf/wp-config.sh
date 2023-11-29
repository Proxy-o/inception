

if [ ! -f "/var/www/wp-config.php" ]; then

wp config create	--allow-root \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PASS \
	--dbhost=mariadb:3306 

wp core install --url=otait-ta.42.fr --title=otait-ta-Blog --admin_user=$WP_ADMIN --admin_password=$WP_PASS --admin_email=$WP_EMAIL
wp user create auth_user auth@example.com --role=author --user_pass=$WP_USER_PASS


fi
