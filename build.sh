#!/bin/sh
# build docker image: euknyaz/ngnix-chrome-supervisord
OWNER=euknyaz
PROJECT=ngnix-chrome-supervisord
VERSION=latest
docker rmi -f $(docker images $OWNER/$PROJECT -q)
docker build --no-cache -f Dockerfile -t $OWNER/$PROJECT . && \
docker tag $OWNER/$PROJECT $OWNER/$PROJECT:$VERSION && \
docker push $OWNER/$PROJECT:$VERSION
