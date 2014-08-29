#!/bin/bash

if [ -z "$1" ]; then
  echo "Syntax: $(basename $0) <target unpack directory>" >&2
  echo "        Execute this command in your flow cell directory" >&2
  exit 1
fi


prefix=$1

for i in 14*
do
  fn=${prefix}/${i}
  if [ -f "$fn.tar" ]; then
    echo "# $fn.tar exists"
  elif [ -f "$fn.zip" ]; then
    echo "# $fn.zip exists"
  else
    echo "# $fn.tar and $fn.zip DO NOT exist"
  fi
done

