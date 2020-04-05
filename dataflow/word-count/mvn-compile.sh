#/bin/bash

export PROJECT_ID=my-test-project-270713
export BUCKET_NAME=lbarrera-1

mvn compile exec:java \
    -Dexec.mainClass=com.example.wordCount \
    -Dexec.args="--project=${PROJECT_ID}" \
    --stagingLocation=gs://${BUCKET_NAME}/staging/ \
    --output=gs://${BUCKET_NAME}/output \
    --runner="BlockingDataflowPipelineRunner"