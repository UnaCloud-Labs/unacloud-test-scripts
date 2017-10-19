#!/usr/bin/env bash


if ! hash cgcreate 2>/dev/null
then
    printf '%s\n' "This script requires cgcreate to be installed. Please run apt-get install cgcreate and run again."
    exit 1
fi

printf '%s\n' "Creating cgroups cpu-limit-10 -> cpu-limit-100"

cgcreate -g cpu:/cpu-limit-10
cgcreate -g cpu:/cpu-limit-20
cgcreate -g cpu:/cpu-limit-30
cgcreate -g cpu:/cpu-limit-40
cgcreate -g cpu:/cpu-limit-50
cgcreate -g cpu:/cpu-limit-60
cgcreate -g cpu:/cpu-limit-70
cgcreate -g cpu:/cpu-limit-80
cgcreate -g cpu:/cpu-limit-90
cgcreate -g cpu:/cpu-limit-100

cgset -r cpu.shares=102 cpu-limit-10
cgset -r cpu.shares=204 cpu-limit-10
cgset -r cpu.shares=307 cpu-limit-10
cgset -r cpu.shares=409 cpu-limit-10
cgset -r cpu.shares=512 cpu-limit-10
cgset -r cpu.shares=614 cpu-limit-10
cgset -r cpu.shares=716 cpu-limit-10
cgset -r cpu.shares=819 cpu-limit-10
cgset -r cpu.shares=921 cpu-limit-10
cgset -r cpu.shares=1024 cpu-limit-10

