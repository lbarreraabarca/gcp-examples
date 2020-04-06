#bin/bash

#Set enviroment variables
gcloud config set compute/zone us-central1-a
gcloud config set project my-test-project-270713

#Create a cluster
gcloud container clusters create my-first-cluster --num-nodes 1

#How to validate a instances list
gcloud compute instances list

# Deploy a wordpress image
kubectl run wordpress --image=tutum/wordpress --port=80
kubectl get pods

# How to expose a services for external traffic
kubectl expose pod POD_NAME --name=wordpress --type=LoadBalancer
