# WordPress on Docker Cloud with MySQL and nginx proxy to use behind HAProxy and letsencrypt.

[WordPress]---[nginx]---[HAProxy]---[Internet]

Based on:

https://dev.to/foresthoffman/hosting-wordpress-over-https-with-docker-5gc

## Source environmental variables

	cp template_ENV_VARS.sh ENV_VARS.sh
	vim ENV_VARS.sh

Edit `export` statements, set variables to your domain name and database parameters.
These variables will be used by docker-compose or docker-cloud to set the service names, domain name (for HAProxy and letsencrypt), and both MySQL and WordPress containers.

To print the current environmental variables: `./ENV_VARS.sh -p`.
To source environmental variables and alter docker-compose.yml and stack.yml: `source ./ENV_VARS.sh`.

## Docker Compose

	docker-compose build
	docker-compose up

Run as a daemon:

	docker-compose up -d

Stop:
	docker-compose stop

Delete:

	docker-compose down

## Docker Cloud

	docker-cloud stack up -n harvestnextdoorcom -f stack.yml

## Build nginx image

This is only required if you are creating or updating your own Docker repository.

	export DOCKER_ID_USER=<your-docker-username>
	docker build --tag wordpress-nginx nginx/
	docker tag wordpress-nginx $DOCKER_ID_USER/wordpress-nginx
	docker push $DOCKER_ID_USER/wordpress-nginx

	docker build --tag wordpress wordpress/
	docker tag wordpress $DOCKER_ID_USER/wordpress
	docker push $DOCKER_ID_USER/wordpress

Note that the docker-compose.yml and stack.yml files use jrusk/wordpress-nginx. Change these files if you use a different Docker repository.

