#!/usr/bin/env bash

#!/usr/bin/env bash
# Please make sure you have ran setup.sh and setup-cgroups.sh before executing this script. Otherwise it will fail!
NUM_PROCESSES="$1"
CGROUP="$2"

for ((i=0; i<NUM_PROCESSES; i=i+1))
do
    cgexec -g cpu/cpu-limit-"$CGROUP" './unacloud-test-files/bin/fibonacci' 200000000 80 23416728348467685 &
done

wait

