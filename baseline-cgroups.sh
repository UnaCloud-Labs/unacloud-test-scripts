#!/usr/bin/env bash

NUM_CORES="$(grep -c ^processor /proc/cpuinfo)"
FOREGROUND_CGROUP=100;

for ((i=1;i<=NUM_CORES; i=i+1))
do
    for ((j=0; j<=NUM_CORES; j=j+1))
    do
        for ((k=10; k<=100; k=k+10))
        do
            (time ./run-fibonacci-cgroups.sh "$i" "$FOREGROUND_CGROUP") > "foreground_${i}_${j}_${k}.txt" 2>&1 &
            (time ./run-fibonacci-cgroups.sh "$j" "$k") > "background_${i}_${j}_${k}.txt" 2>&1 &
            wait
            sleep 1m
        done
    done
done

