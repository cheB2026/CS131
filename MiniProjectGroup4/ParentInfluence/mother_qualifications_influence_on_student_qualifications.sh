#!/bin/bash

file=$1
out_file=$2

echo "Mother qualification and previous qualifications group by"
echo "$(sed '1d' $file | cut -d ',' -f 4,2 | sort | uniq -c | sort -nr)"
