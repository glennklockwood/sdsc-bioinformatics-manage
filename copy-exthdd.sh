#!/usr/bin/env bash

if [ -z "$1" -o -z "$2" ]; then
  echo "Syntax: $0 </mnt/path/to/usb/drive> </path/to/tarfile/dest>" >&2
  exit 1
else
  src=$1
  dest=$2
fi
echo "Using src=$src"

cd $src

for i in $(find . -maxdepth 1 -type d -name 14\*)
do
  desttar="$dest/${i}.tar"
# desttar="$dest/${i}.zip"
  if [ -f $desttar ]; then
    echo "ERROR: $desttar already exists.  Skipping..." >&2
  else
    /usr/bin/time tar cf "$desttar" $i --exclude=$i/Thumbnail_Images > $dest/${i}.tar.log 2>&1
#   /usr/bin/time zip -0 -r "$desttar" $i -x \*/Thumbnail_Images/\* > $dest/${i}.log 2>&1
  fi
done
