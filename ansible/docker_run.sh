#!/bin/bash
APP_NAME=app_java-web
if docker ps -a | grep $APP_NAME; then
    docker rm -f  $(docker ps -a|grep $APP_NAME|awk '{print $1}')
	docker rmi -f  $(docker images|grep $APP_NAME|awk '{print $3}')
fi
if docker ps -a | grep none; then
	docker rmi -f  $(docker images|grep none|awk '{print $3}')
fi
docker pull my-registry:5000/app_java-web
docker run --name $APP_NAME -p 3000:8080 -d my-registry:5000/app_java-web
unset APP_NAME
