#!/bin/bash

source value_to_qualification_mapping.sh

file=$1
output_file=$2

echo "father qualification,previous qualification,target,count" > $output_file

awk -F ',' 'NR>1 { count[$5]++ } END { for (key in count) print key,count[key] }' $file | sort -k2 -rn | head -5 | while read -r father_qual count
do
  father_mapping=$(get_mapped_value $father_qual)
  echo "$father_mapping,,,$count" >> $output_file

  awk -F ',' -v father_qual="$father_qual" '$5==father_qual { count[$2]++ } END { for (key in count) print key, count[key] }' $file | sort -k2 -rn | head -5 | while read -r prev_qual prev_count
  do
    prev_mapping=$(get_mapped_value $prev_qual)
    echo "$father_mapping,$prev_mapping,,$prev_count" >> $output_file

    awk -F ',' -v father_qual="$father_qual" -v prev_qual="$prev_qual" '$5==father_qual && $2==prev_qual { count[$15]++ } END { for (key in count) print key, count[key] }' $file | sort -k2 -rn | head -5 | while read -r target target_count
    do
      echo "$father_mapping,$prev_mapping,$target,$target_count" >> $output_file
    done
  done
done
