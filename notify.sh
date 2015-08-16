#!/bin/bash

NGINX_CONF=/etc/nginx/nginx.conf
NGINX_DOCKER_CONF=/etc/nginx/sites-enabled/docker.conf
LOG_FILE=/var/log/docker-gen.log

remove_blank_line(){
  sed -i '/^[[:space:]]*$/d' $1
}

check_configuration(){
  CHECK_CONF=$(/usr/sbin/nginx -t -c $1 > /dev/null 2>&1)
  if [[ $? == 0 ]] ; then
    /etc/init.d/nginx reload
  else
    echo "[$(date)] Error in Nginx configuration :" >> $LOG_FILE
    /usr/sbin/nginx -t -c $1 >> $LOG_FILE 2>&1
  fi
}

remove_blank_line $NGINX_DOCKER_CONF
check_configuration $NGINX_CONF
