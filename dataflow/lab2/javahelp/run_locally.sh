#!/bin/bash

if [ "$#" -ne 1 ]; then
   echo "Usage:   bash run_locally.sh mainclass-basename"
   echo "Example: bash run_locally.sh Grep"
   exit
fi

MAIN=com.google.cloud.training.dataanalyst.javahelp.$1

export PATH=/usr/lib/jvm/java-8-openjdk-amd64/bin/:$PATH
mvn compile -e exec:java -Dexec.mainClass=$MAIN
