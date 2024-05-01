#!/bin/bash

file=$1
output_file=$2

sed -n 1p $file > $output_file
filtered_result=$(awk -F ',' 'NR > 1 && $1!="" && $2!="" && $3!="" && $4!=""' $file)
echo "$filtered_result" >> $output_file
readarray -t unique_previous_qual < <(echo "$filtered_result" | awk -F ',' '{print $2}' | sort | uniq)
readarray -t unique_primary_qual < <(echo "$filtered_result" | awk -F ',' '{print $1}' | sort | uniq)

for primary_qual in "${unique_primary_qual[@]}";
do
  readarray -t primary_unique_previous_qual < <(echo "$filtered_result" | awk -F ',' -v primary_qual="$primary_qual" '$1==primary_qual {print $2}' | sort | uniq)

  for prev_qual in "${unique_previous_qual[@]}"; do
    found=false
    for prim_prev_qual in "${primary_unique_previous_qual[@]}"; do
      if [[ "$prev_qual" == "$prim_prev_qual" ]]; then
        found=true
        break
      fi
    done
    if [[ "$found" == false ]]; then
      echo "$primary_qual,$prev_qual,Graduate,0" >> $output_file
      echo "$primary_qual,$prev_qual,Dropout,0" >> $output_file
      echo "$primary_qual,$prev_qual,Enrolled,0" >> $output_file
    fi
  done
done
