#!/usr/bin/env bash

docker build -t pcmagas/alpinebuild .

BRANCH=${GITHUB_REF##*/}

if [[ $BRANCH == 'master' ]]; then
    docker image push pcmagas/alpinebuild:latest
fi