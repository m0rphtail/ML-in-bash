#!/bin/bash

cd dataset
for DATA_FILE in `ls TAVG_US_*.csv`

do
    echo ${DATA_FILE}
    awk -v FILE=$DATA_FILE -F, '
        {
            state_day_sum[$1 "," $2 "," $3 "," $4] = state_day_sum[$1 "," $2 "," $3 "," $4] + $5
            state_day_num[$1 "," $2 "," $3 "," $4] = state_day_num[$1 "," $2 "," $3 "," $4] + 1
        }
        END {
            for (state_day_key in state_day_sum) {
                print state_day_key "," state_day_sum[state_day_key]/state_day_num[state_day_key]
            }
        }
    ' OFS=, $DATA_FILE > STATE_DAY_${DATA_FILE}.tmp
    sort -k1 -k2 -k3 -k4 < STATE_DAY_${DATA_FILE}.tmp > STATE_DAY_$DATA_FILE
    rm -f STATE_DAY_${DATA_FILE}.tmp
done

PATTERN_FILE=us_stations.txt

cd dataset
for DATA_FILE in `ls TAVG_US_*.csv`
do
    echo ${DATA_FILE}

    awk -F, \
        'FNR==NR { x[$1]=$2; next; } { $1=x[$1]; print $0 }' \
        OFS=, \
        ${PATTERN_FILE} ${DATA_FILE} > ${DATA_FILE}.tmp

   mv ${DATA_FILE}.tmp ${DATA_FILE}
done