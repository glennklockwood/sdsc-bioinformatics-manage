#!/bin/bash

echo "# Execute this command in your flow cell zip/tar directory" >&2

for i in *.zip *.tar
do
  bn=$(basename $i .zip)
  if [ -d ../$bn ]; then
    echo "# $i exists"
  else
    if [ -d ../$(basname $i .tar) ]; then
      echo "# $i exists"
    else
      echo "# $i DOES NOT exist"
      echo "unzip tars/$i"
    fi
  fi
done
