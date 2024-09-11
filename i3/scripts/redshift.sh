#!/bin/bash

if [ ! $(which redshift) ]; then
    echo -e "[\033[31m-\033[00m] redshift not found !"
    exit 1
fi

if [ ! $(which curl) ]; then
    echo -e "[\033[31m-\033[00m] curl not found !"
    exit 1
fi

LOC=$(curl -s http://ipinfo.io/json | jq .loc | tr -d '"' | tr ',' ':')

redshift -m randr -l $LOC 2>&1 > /dev/null
