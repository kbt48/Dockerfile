#/bin/bash

LIST='./container.list'
DATA_DIR=/home/docker
LOG_DIR=/var/log/docker
NGINX_IMAGE='hiroki/nginx'
PHP_FPM_IMAGE='hiroki/php-fpm'
JENKINS_IMAGE='hiroki/jenkins'

# Read container.list
IFS=$'\n'
CONTAINER_LIST=(`cat "$LIST"`)

# Create share directory between HOST and CONTAINER for LOG and permanent data.
# Create container data directory.
if [ ! -d $DATA_DIR ]; then
	echo "Create DATA_DIR($DATA_DIR) for docker container."
	mkdir $DATA_DIR
	for i in "${CONTAINER_LIST[@]}"; do
		echo "Create $DATA_DIR/$i."
		mkdir $DATA_DIR/$i
	done
else
	echo "already exit data directory."
fi

# Create container log directory.
if [ ! -d $LOG_DIR ]; then
	echo "Create LOG_DIR($LOG_DIR) for docker container."
	mkdir $LOG_DIR
	for i in "${CONTAINER_LIST[@]}"; do
		echo "Create $LOG_DIR/$i."
		mkdir $LOG_DIR/$i
	done
else
	echo "already exit log directory."
fi

# Run php-fpm container
echo "Run php-fpm container..."
docker run \
	-d \
	-P \
	-v $DATA_DIR/nginx:/usr/share/nginx/html \
	-v $LOG_DIR/php-fpm:/var/log/php-fpm \
	--name php-fpm \
	$PHP_FPM_IMAGE

sleep 3

# Run nginx container
echo "Run nginx container..."
docker run \
	-d \
	-p 80:80 \
	--name nginx \
	--link php-fpm:php \
	-v $DATA_DIR/nginx:/usr/share/nginx/user_docroot \
	-v $LOG_DIR/nginx:/var/log/nginx \
	$NGINX_IMAGE
