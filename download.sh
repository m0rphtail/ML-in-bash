#!/bin/bash

FROM_YEAR=2010
TO_YEAR=2019

year=$FROM_YEAR
mkdir -p dataset
# For all years one by one starting from FROM_YEAR=2010 upto TO_YEAR=2019
while [ $year -le $TO_YEAR ]
do
    # show the year being downloaded now
    echo $year
    # Download
    wget -q --show-progress https://www1.ncdc.noaa.gov/pub/data/ghcn/daily/by_year/${year}.csv.gz
    # Move to next year by incrementing
    year=$(($year+1))
done

year=$FROM_YEAR
cd dataset
while [ $year -le $TO_YEAR ]
do
    # show the year being downloaded now
    echo $year
    gzip -d dataset/${year}.csv.gz
    # Move to next year by incrementing
    year=$(($year+1))
done