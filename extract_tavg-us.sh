#!/bin/bash

# extracts tavg for US regions from the downloaded data
cd dataset
for csv_file in `ls 20*.csv`
do
    echo "$csv_file -> TAVG_US_$csv_file"
    grep "TAVG" $csv_file | grep "^US" > TAVG_US_$csv_file
done