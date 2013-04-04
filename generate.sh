#!/bin/bash

# Generates all datapoints from (START_X,START_Y) to (MAX_X,MAX_Y)

MAX_X=1024;
MAX_Y=10;
START_X=0;
START_Y=0;

for (( x=$START_X; x < $MAX_X; x++ ))
do
  for (( y=$START_Y; y < $MAX_Y; y++ ))
  do
    px=`echo ${x} | sed 's/[0-9]\{1,\}/0000&/g;s/0*\([0-9]\{4,\}\)/\1/g'`
    py=`echo ${y} | sed 's/[0-9]\{1,\}/0000&/g;s/0*\([0-9]\{4,\}\)/\1/g'`
    fname="dejong-${MAX_X}-${px}-${py}.json.gz"
    if [ ! -f $fname ]; then
      echo "building ${fname}"
      ~/bin/dejong $x $y | gzip -q -f -c > $fname
    else
      echo "${fname} exists, skipping"
    fi
  done
done
