#!/bin/bash

if [ "$#" -ne 3 ]; then
   echo "Usage:   bash run_oncloud_params.sh project-name  bucket-name  mainclass-basename"
   echo "Example: bash run_oncloud_params.sh my-test-project-270713  lbarrera-1  Grep"
   exit
fi

PROJECT=$1
BUCKET=$2
MAIN=com.google.cloud.training.dataanalyst.javahelp.$3

echo "project=$PROJECT  bucket=$BUCKET  main=$MAIN"

export PATH=/usr/lib/jvm/java-8-openjdk-amd64/bin/:$PATH
mvn compile -e exec:java \
 -Dexec.mainClass=$MAIN \
      -Dexec.args="--project=$PROJECT \
      --stagingLocation=gs://$BUCKET/staging/ \
      --tempLocation=gs://$BUCKET/staging/ \
      --runner=DataflowRunner"
