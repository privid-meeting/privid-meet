#!/usr/bin/env bash

ENV=$1

LIBS=libs
PRIVID_DIR=privid-meet
DEPLOY_LOCATION=../jitsi-dist
LOCAL=./${DEPLOY_LOCATION}/${PRIVID_DIR}

rm -rf ${LOCAL}

mkdir -p ${LOCAL}/css && \
	cp -r *.js *.html resources/*.txt connection_optimization favicon.ico fonts images libs static sounds LICENSE lang $LOCAL && \
	cp css/all.css $LOCAL/css

if [[ $ENV ]]
then
    rm $LOCAL/config.js
    rm $LOCAL/*-config.js
    cp $ENV-config.js $LOCAL/config.js
fi

mkdir -p $LOCAL/libs && cp $LIBS/* $LOCAL/libs

cd $DEPLOY_LOCATION
rm -f ${PRIVID_DIR}.zip
zip -r ${PRIVID_DIR} ${PRIVID_DIR}

if [[ $ENV ]]
then echo "deploying to $ENV"
fi