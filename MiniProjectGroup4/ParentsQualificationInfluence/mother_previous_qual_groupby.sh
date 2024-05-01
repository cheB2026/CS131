#!/bin/bash

source value_to_qualification_mapping.sh

file=$1
output_file=$2

echo "mother qualification,previous qualification,target,count" > $output_file

awk -F ',' 'NR>1 { count[$4]++ } END { for (key in count) print key,count[key] }' $file | sort -k2 -rn | head -5 | while read -r mother_qual count
do
  mother_mapping=$(get_mapped_value $mother_qual)
  echo "$mother_mapping,,,$count" >> $output_file

  awk -F ',' -v mother_qual="$mother_qual" '$4==mother_qual { count[$2]++ } END { for (key in count) print key, count[key] }' $file | sort -k2 -rn | head -5 | while read -r prev_qual prev_count
  do
    prev_mapping=$(get_mapped_value $prev_qual)
    echo "$mother_mapping,$prev_mapping,,$prev_count" >> $output_file

    awk -F ',' -v mother_qual="$mother_qual" -v prev_qual="$prev_qual" '$4==mother_qual && $2==prev_qual { count[$15]++ } END { for (key in count) print key, count[key] }' $file | sort -k2 -rn | head -5 | while read -r target target_count
    do
      echo "$mother_mapping,$prev_mapping,$target,$target_count" >> $output_file
    done
  done
done
