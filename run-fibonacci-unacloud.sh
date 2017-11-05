#!/usr/bin/env bash

# Please make sure you have ran setup.sh before executing this script. Otherwise it will fail!
NUM_PROCESSES="$1"

for ((i=0; i<NUM_PROCESSES; i=i+1))
do
    ./unacloud-test-files/bin/fibonacci 200000000 80 23416728348467685 &
    ./unacloud-test-files/bin/register_uc $!
done

wait

