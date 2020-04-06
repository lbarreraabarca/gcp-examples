#/bin/bash

export BUCKET_NAME=test-bucket-1

gsutil mb -c regional -l us-central1 gs://${BUCKET_NAME}

gcloud compute regions list