#!/usr/bin/env bash

NUM_PROCESSES="$1"
NICE_LEVEL="$2"

for ((i=0; i<NUM_FOREGROUND_PROCESSES; i=i+1))
do
    nice -n "$NICE_LEVEL" './unacloud-test-files/bin/fibonacci' &
done

wait