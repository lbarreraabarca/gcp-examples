#!/bin/bash

sudo pip install google-cloud-pubsub
cd publish
bash download_data.sh
python send_sensor_data.py --speedFactor=60