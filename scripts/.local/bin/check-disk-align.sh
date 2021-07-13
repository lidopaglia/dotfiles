#!/bin/sh

for f in /sys/block/*/*/start
do
    start=$(cat $f)
    echo $f : $start : $(($start % 8)) : $(($start % 2048))
done
