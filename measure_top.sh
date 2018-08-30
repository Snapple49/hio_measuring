#!/bin/sh
step=5
echo "time, top output (python, docker)" >> top_out.csv
i=0
while true; do
    echo $i",$(top -b -n 1 | egrep 'python|docker')" | tr " " "_" | tr "\n" "-" >> top_out.csv
    i=$(($i+$step))
    sleep $step
done
