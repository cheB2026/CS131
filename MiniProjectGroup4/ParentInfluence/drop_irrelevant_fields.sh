#!/bin/bash

file=$1
out_file=$2

awk -F ',' 'BEGIN {OFS=","} {print $1,$6,$8,$9,$10,$11,$12,$15,$16,$17,$18,$19,$20,$21,$37}' $file > $out_file
