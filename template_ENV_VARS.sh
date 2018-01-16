#!/usr/bin/env bash

# to source environmental variables: `source ./ENV_VARS.sh`
# to print environmental variables: `./ENV_VARS.sh -p`

# Get argument or default to source
if [ -z "$1" ]; then
    ARG=source
else
    ARG=$1
fi

if [ "$ARG" = "-p" ]; then
  printf '\nEnvironmental variables:\n'
  echo 'DOMAIN_NAME:' $DOMAIN_NAME
  echo 'MYSQL_USER:' $MYSQL_USER
  echo 'MYSQL_PASSWORD:' $MYSQL_PASSWORD
  echo 'MYSQL_ROOT_PASSWORD:' $MYSQL_ROOT_PASSWORD
  exit
fi

export DOMAIN_NAME=
export MYSQL_USER=
export MYSQL_PASSWORD=
export MYSQL_ROOT_PASSWORD=

echo 'Set environmental variables, following are the current settings:'

echo 'DOMAIN_NAME:' $DOMAIN_NAME
echo 'MYSQL_PASSWORD:' $MYSQL_PASSWORD
echo 'MYSQL_ROOT_PASSWORD:' $MYSQL_ROOT_PASSWORD
echo 'MYSQL_USER:' $MYSQL_USER

sed -i.bu "s/harvestnextdoorcom/${DOMAIN_NAME//.}/g" docker-compose.yml
sed -i.bu "s/harvestnextdoorcom/${DOMAIN_NAME//.}/g" stack.yml
sed -i.bu "s/harvestnextdoor.com/${DOMAIN_NAME}/g" stack.yml

echo 'Changed docker-compose.yml and stack.yml names based on' ${DOMAIN_NAME}
