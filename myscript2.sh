#!/bin/bash
#
# This intro script uses a set of piped commands we learned earlier
# and executes them in a bash script
#
DIR=$HOME/Practice
COLS=2-4,14
OUT=$DIR/test_example
IN=$DIR/g2f_2015_hybrid_data_raw.csv

# Hey, let's get started!
echo -n 'Starting script: ' ; date
cd $DIR
if [ ! -d $OUT ]; then mkdir $OUT; fi

# extract out planting dates first
cut -d , -f $COLS $IN > $OUT/00_planting_dates.txt

# make sure planting dates are sorted
sort --field-separator=, $OUT/00_planting_dates.txt > $OUT/01_planting_dates_sorted.txt
uniq -c $OUT/01_planting_dates_sorted.txt > $OUT/02_city_date_counts.txt
sort -rn $OUT/02_city_date_counts.txt > $OUT/03_city_date_counts_sorted.txt

echo -n 'Finishing script: ' ; date

