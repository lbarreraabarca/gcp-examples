#/bin/bash

export DATAPROC_REGION=us-central1
export DATAPROC_ZONE=us-central1-b
export CLUSTER_NAME=my-cluster

gcloud config set dataproc/region ${DATAPROC_REGION}

cluster_creation=$(gcloud dataproc clusters list | grep -w "${CLUSTER_NAME}" | wc -l)

if [ "$cluster_creation" == "0" ];
then
    gcloud dataproc clusters create ${CLUSTER_NAME} \
        --region ${DATAPROC_REGION} --zone ${DATAPROC_ZONE} \
        --master-machine-type n1-standard-1 --master-boot-disk-size 50 \
        --num-workers 2 \
        --worker-machine-type n1-standard-1 --worker-boot-disk-size 50 \
        --network=default
fi

validator=$(gsutil list | grep -w "gs://${DEVSHELL_PROJECT_ID}/" | wc -l)

if [ "$validator" == "0" ];
then
    gsutil mb -c regional -l us-central1 gs://${DEVSHELL_PROJECT_ID}
fi