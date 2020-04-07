#/bin/bash

export BUCKET_NAME=test-bucket-1
export LIFECYCLE_JSON=lifecycle.json

#How to list a buckets
gsutil ls

#How to copy a elements of bucket in another 
gsutil cp -r -p gs://loony-bucket-1/* gs://${BUCKET_NAME}/

#How to get lifecycle of a bucket
gsutil lifecycle get gs://${BUCKET_NAME}/

gsutil lifecycle set ${LIFECYCLE_JSON} gs://${BUCKET_NAME}/
