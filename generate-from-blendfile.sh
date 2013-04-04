#!/bin/bash

# Generates data from a CSV formatted ?,x,y

MAX_X=1024;

if [ -z $1 ] ; then
  echo "supply a filename"
  exit 1
fi

COUNTER=0
while IFS=, read col1 col2 col3
do
  px=`echo ${col2} | sed 's/[0-9]\{1,\}/0000&/g;s/0*\([0-9]\{4,\}\)/\1/g'`
  py=`echo ${col3} | sed 's/[0-9]\{1,\}/0000&/g;s/0*\([0-9]\{4,\}\)/\1/g'`
  fname="dejong-${MAX_X}-${px}-${py}.json.gz"
  if [ ! -f $fname ]; then
    echo "building ${fname} for ${col2} ${col3} [${COUNTER}]"
    ~/bin/dejong $px $py | gzip -q -f -c  > $fname
  else
    echo "${fname} exists, skipping"
  fi
  COUNTER=$((COUNTER+1))
done < $1


