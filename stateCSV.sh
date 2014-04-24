#!/bin/sh 

while read line
do 
    opt=$line
    temp="${opt%\"}"
    temp="${temp#\"}"
    echo "$temp"
    filename="$opt_zipde"
    awk -F '","' 'BEGIN { OFS="," } { if (toupper($3) == '"$line"' ) print }' zipcode.csv > ${temp}_zipde.csv
    awk -F, 'BEGIN { OFS="," } {print $1 }' ${temp}_zipde.csv |sed -e 's/^"//'  -e 's/"$//' > ${temp}_ziponly.csv

done < stat_br.csv
