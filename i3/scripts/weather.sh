#!/bin/bash
#Author: sam0verfl0w

TOOLS=(curl jq)

for tool in ${TOOLS[@]}; do
    if [ ! $(which $tool) ]; then
        echo -e "[\033[31m-\033[00m] $tool not found !"
        exit 1
    fi
done

CITY=$(curl -s http://ipinfo.io/json | jq .city | tr -d '"')

if [ -z $CITY ]; then
    echo -e "[\033[31m-\033[00m] Error Location !"
    exit 1
fi

WEATHER=$(curl -s "http://wttr.in/{$CITY}?format=3")

if [ $? != "0" ]; then
    echo -e "[\033[31m-\033[00m] Error while getting weather !"
    exit 1
fi

echo $WEATHER
