#!/usr/bin/env bash

if ! hash git 2>/dev/null
then
    printf '%s\n' "This script requires git to be installed. Please run apt-get install git and run again."
    exit 1
fi

if ! hash gcc 2>/dev/null
then
    printf '%s\n' "This script requires gcc to be installed. Please run apt-get install gcc and run again."
    exit 1
fi

if ! hash make 2>/dev/null
then
    printf '%s\n' "This script requires make to be installed. Please run apt-get install make and run again."
    exit 1
fi

if ! hash cpulimit 2>/dev/null
then
    printf '%s\n' "This script requires cpulimit to be installed. Please run apt-get install cpulimit and run again."
    exit 1
fi

if [ ! -d "./unacloud-test-files" ]
then
    mkdir "./unacloud-test-files"
else
    printf '%s\n' "unacloud-test-files directory found. Overriding contents"
fi

cd "unacloud-test-files"

if [ ! -d "bin" ]
then
    mkdir "bin"
else
    printf '%s\n' "Found bin directory."
fi

echo "The files contained in unacloud-test-files will be used to test the unacloud task scheduler" >> README

printf '%s\n' "Cloning fibonacci test suite repository"
git clone "https://github.com/adelavegaf/fibonacci-test-suite.git"
cd "fibonacci-test-suite"

printf "%s\n" "Generating Fibonacci executable from fibonacci-test-suite repository"
gcc -std=c99 fibonacci.c -o fibonacci
mv fibonacci ../bin/

cd ..

printf '%s\n' "Cloning the unacloud task tools repository"
git clone "https://github.com/UnaCloud-Labs/unacloud-task-tools.git"
cd "unacloud-task-tools"

printf "%s\n" "Generating register_uc executable from unacloud-task-tools repository"
make
mv register_uc ../bin/
