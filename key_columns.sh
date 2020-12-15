#!/bin/sh
cd dataset
# For each file with name that starts with "TAVG_US_" and ens with ".csv"
for csv_file in `ls TAVG_US_*.csv`
do
    echo "Exractiing columns $csv_file"
    cat $csv_file | cut -d',' -f1,2,4 > $csv_file.cut
    mv $csv_file.cut $csv_file
done