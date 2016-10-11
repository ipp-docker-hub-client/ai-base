#!/bin/bash
set -e

if [[ "$1" == init ]] || [ "$1" == start ]; 
then
  echo "Linking libdc1394 to null!"
  ln /dev/null /dev/raw1394 #to remove depricated warning: libdc1394 error: Failed to initialize libdc1394
  echo "Initiating Python ..."
  python /usr/src/app/main.py
fi

exec "$@"
