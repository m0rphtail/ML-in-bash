#!/bin/bash

wget ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/ghcnd-stations.txt
grep "^US" ghcnd-stations.txt > us_stations.txt
cat us_stations.txt | tr -s ' ' > us_stations.txt.tmp
cp us_stations.txt.tmp us_stations.txt
cut -d' ' -f1,5 us_stations.txt > us_stations.txt.tmp
mv us_stations.txt.tmp us_stations.txt
sed -i s/' '/,/g us_stations.txt