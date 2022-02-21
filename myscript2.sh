#!/bin/bash
#
# This intro script uses a set of piped commands we learned earlier
# and executes them in a bash script
#
DIR=$HOME/Practice
COLS=2-4,14
OUT=test_example

echo -n 'Starting script: ' ; date
cd $DIR
if [ ! -d $OUT ]; then mkdir $OUT; fi
cut -d , -f $COLS g2f_2015_data/a._2015_hybrid_phenotypic_data/g2f_2015_hybrid_data_raw.csv > $OUT/00_planting_dates.txt
sort --field-separator=, $OUT/00_planting_dates.txt > $OUT/01_planting_dates_sorted.txt
uniq -c $OUT/01_planting_dates_sorted.txt > $OUT/02_city_date_counts.txt
sort -rn $OUT/02_city_date_counts.txt > $OUT/03_city_date_counts_sorted.txt
echo -n 'Finishing script: ' ; date

