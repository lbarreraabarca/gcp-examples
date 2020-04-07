#/bin/bash

export BUCKET_NAME=test-bucket-1

cd lab2b

bash ingest.sh 
ls -l earthquakes.csv 

bash install_missing.sh 
python3 transform.py 
 
gsutil cp earthquakes.* gs://${BUCKET_NAME}
