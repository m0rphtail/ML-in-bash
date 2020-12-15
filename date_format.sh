#!/bin/bash

cd dataset
for csv_file in `ls TAVG_*.csv`
do
    echo Date formatting $csv_file
    # inserts , after year
    sed -i 's/,..../&,/' $csv_file
    # inserts , after month
    sed -i 's/,....,../&,/' $csv_file
done