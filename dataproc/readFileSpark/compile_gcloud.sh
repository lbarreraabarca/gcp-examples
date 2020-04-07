#/bin/bash

export BUCKET_NAME=lbarrera-1
export PROJECT_NAME=readFileSpark

mvn clean package

# Copy in Bucket jars files.
gsutil cp target/*.jar gs://${BUCKET_NAME}/scala-jars/${PROJECT_NAME}/

# Copy in Bucket inout files
gsutil cp input/PAMP.BA.csv gs://${BUCKET_NAME}/scala-jars/${PROJECT_NAME}/input/

gsutil rm gs://${BUCKET_NAME}/scala-jars/${PROJECT_NAME}/output/
