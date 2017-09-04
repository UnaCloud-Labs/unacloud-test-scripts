#!/usr/bin/env bash
NUM_CORES="$(grep -c ^processor /proc/cpuinfo)"
for ((i=1;i<=NUM_CORES; i=i+1))
do
    for ((j=0; j<=NUM_CORES; j=j+1))
    do
        (time ./run-fibonacci.sh "$i" 0) > "foreground_${i}_${j}.txt" 2>&1 &
        (time ./run-fibonacci.sh "$j" 19) > "background_${i}_${j}.txt" 2>&1 &
        wait
        sleep 1m
    done
done

