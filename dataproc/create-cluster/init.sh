#/bin/bash

gcloud dataproc clusters create my-cluster --zone us-central1-a \
    --master-machine-type n1-standard-1 --master-boot-disk-size 50 \
    --num-workers 2 \
    --worker-machine-type n1-standard-1 --worker-boot-disk-size 50 \
    --network=default