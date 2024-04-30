#!/bin/bash

file=$1
out_file=$2

echo "Student qualification and Target group by"
echo "$(sed '1d' $file | cut -d ',' -f 2,15 | sort | uniq -c | sort -nr)"
