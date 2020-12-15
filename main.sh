#!/bin/bash

bash download.sh
bash extract_tavg-us.sh
bash key_columns.sh
bash date_format.sh
bash agg_state_tavg.sh
bash station_to_state_data.sh