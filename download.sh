#!/bin/bash

FROM_YEAR=2010
TO_YEAR=2011

year=$FROM_YEAR
mkdir -p dataset
while [ $year -le $TO_YEAR ]
do
    #echo $year
    wget -q --show-progress https://www1.ncdc.noaa.gov/pub/data/ghcn/daily/by_year/${year}.csv.gz -P dataset
    gzip -d dataset/${year}.csv.gz
    year=$(($year+1))
done