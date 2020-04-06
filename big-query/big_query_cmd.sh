#/bin/bash

bq ls
bq shell

# How to describe a dataset 
bq show babynames

# Get data from big query table
bq head -n 10 babynames.babyname2016
bq query "SELECT * FROM babynames.babyname2016;"
