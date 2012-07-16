#!/bin/bash

DIR="${HOME}/Images/screenshots"
DATE="$(date +%Y%m%d@H%M%S)"
NAME="${DIR}/sc-${DATE}.png"
LOG="${DIR}/screenshots.log"

if [ ! -d "${DIR}" ]; then mkdir -p "${DIR}"; fi

if [ "$1" = "win" ]; then import "${NAME}"; fi

if [ "$1" = "src" ]; then import -window root "${NAME}"; fi

if [ "$1" = "area" ]; then import "${NAME}"; fi

if [[ $# = 0 ]]; then
    echo "No scrrenshot taken - something odd"
    echo "${DATE}: You got shitfaced by screenshto - please try again" >> "${LOG}"
else
   echo "${NAME} - saved to screenshots" >> "${LOG}"
fi
