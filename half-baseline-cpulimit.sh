#!/usr/bin/env bash

NUM_CORES="$(grep -c ^processor /proc/cpuinfo)"
FOREGROUND_CGROUP=100;

for ((i=1;i<=NUM_CORES; i=i+1))
do
    for ((j=0; j<=NUM_CORES; j=j+1))
    do
        for ((k=10; k<=50; k=k+10))
        do
            printf '%s\n' "Running Fibonacci with ${i} foreground, ${j} background, cpulimit ${k}."
            (time ./run-fibonacci.sh "$i" 0) > "foreground_${i}_${j}_${k}.txt" 2>&1 &
            (time ./run-fibonacci-cpulimit.sh "$j" "$k") > "background_${i}_${j}_${k}.txt" 2>&1 &
            wait
            sleep 30
        done
    done
done

