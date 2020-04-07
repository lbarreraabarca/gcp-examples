#bin/bash

# How to get environment variables
gcloud config get-value compute/zone
gcloud config get-value compute/region

# How to set environment variables
gcloud config set compute/zone us-central1-a
