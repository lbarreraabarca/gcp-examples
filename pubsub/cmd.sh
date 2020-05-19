#!/bin/bash

gcloud beta pubsub topics create myTopic
gcloud beta pubsub topics publish myTopic "Hello"

gcloud beta pubsub subscriptions create --topic myTopic mySub
gcloud beta pubsub subscriptions pull --auto-ack mySub



gcloud beta pubsub topics publish myTopic "Hello how are you"
gcloud beta pubsub subscriptions pull --auto-ack mySub


gcloud beta pubsub topics publish myTopic "Hello1"
gcloud beta pubsub topics publish myTopic "Hello2"
gcloud beta pubsub topics publish myTopic "Hello3"